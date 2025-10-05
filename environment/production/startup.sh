	
#!/bin/bash
set -euo pipefail

# Log everything
exec > /var/log/startup-script.log 2>&1
echo "[INFO] Starting startup script at $(date)"

# Known-good PATH for boot-time environment
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export DEBIAN_FRONTEND=noninteractive

# Helpful error context
trap 'rc=$?; echo "[ERROR] failed at line ${LINENO} (exit ${rc})"; exit $rc' ERR

# Wait until apt/dpkg locks are free
wait_for_apt() {
  while fuser /var/lib/dpkg/lock-frontend /var/cache/apt/archives/lock \
              /var/lib/apt/lists/lock >/dev/null 2>&1; do
    echo "[INFO] apt/dpkg busy; waiting..."
    sleep 3
  done
}

# Retry helper for flaky network/package ops
retry() {
  local n=0 max=5 delay=5
  until "$@"; do
    n=$((n+1))
    if [ $n -ge $max ]; then
      echo "[ERROR] Command failed after $n attempts: $*"
      return 1
    fi
    echo "[WARN] Command failed. Attempt $n/$max. Retrying in ${delay}s..."
    sleep "$delay"
  done
}

# Update & install SDK (provides gsutil)
wait_for_apt
retry apt-get update -y
wait_for_apt
retry apt-get install -y google-cloud-sdk

# Workdir
mkdir -p /opt/websetup
cd /opt/websetup

# Verify gsutil is present
command -v gsutil >/dev/null 2>&1 || { echo "[ERROR] gsutil missing after install"; exit 1; }

# Fetch installer from GCS (requires VM SA read perms)
BUCKET="gs://webserver-app"
OBJECT="setup-web.sh"
retry gsutil cp "${BUCKET}/${OBJECT}" .

chmod +x "./${OBJECT}"
echo "[INFO] Running ${OBJECT}..."
"./${OBJECT}"

echo "[INFO] Startup script finished at $(date)"