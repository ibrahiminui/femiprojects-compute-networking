variable "network_name" {
  description = "The GCP project you want to manage"
  default     = "compute-us-west2-subnet"
  type        = string
}

variable "project_id" {
  description = "The GCP project you want to manage"
  default     = "global-shared-networking"
  type        = string
}

variable "gke-project" {
  description = "The GCP project you want to manage"
  default     = "global-web-server-473500"
  type        = string
}

variable "region" {
  type        = string
  description = "Default Google Cloud region"
  default     = "us-west2"
}

variable "shared-vpc-network" {
  type        = string
  description = "shared vpc gke network"
  default     = "projects/global-shared-networking/regions/us-west2/subnetworks/gke-us-west2-subnet"
}
/*


variable "service_account" {
  type        = string
  default     = "736145175780-compute@developer.gserviceaccount.com"
  description = "Default Google Cloud region"
}

variable "network_project" {
  type        = string
  description = "project id of the hosted project where network been provisioned"
  default     = "dbk-global-networking"
}

variable "network" {
  type        = string
  description = "VPC network"
}

variable "subnetwork" {
  type        = string
  description = "subnet for nodes"
}

variable "gke_cluster" {
  type        = list(any)
  description = "variables for the gke cluster resource."
  default     = []
}

variable "default_gke_cluster" {
  type        = map(any)
  description = "default variable values for the gle cluster resource."
  default = {
    "name"                                = "my-gke-cluster"
    "description"                         = "Description of the gke cluster"
    "config_connector_config"             = "false"
    "default_max_pods_per_node"           = "16"
    "logging_service"                     = "logging.googleapis.com/kubernetes"
    "monitoring_service"                  = "monitoring.googleapis.com/kubernetes"
    "release_channel"                     = "UNSPECIFIED"
    "min_master_version"                  = null
    "enable_private_endpoint"             = "true"
    "enable_private_nodes"                = "true"
    "master_ipv4_cidr_block"              = ""
    "http_load_balancing"                 = "false"
    "network_policy_provider"             = "CALICO"
    "enable_network_policy"               = "true"
    "horizontal_pod_autoscaling"          = "false"
    "vertical_pod_autoscaling"            = "false"
    "istio_config"                        = "true"
    "daily_maintenance_enabled"           = "false"                # Maintenance recurring_window and therefor end time and recurrence only take effect if daily_maintenance_enabled is false
    "maintenance_start_time"              = "2023-05-01T06:00:00Z" # if daily_maintenance_enabled is false the format of this field should be like "2023-01-05T10:00:00Z"
    "maintenance_end_time"                = "2023-05-01T10:00:00Z"
    "maintenance_recurrence"              = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR"
    "cluster_autoscaling_enabled"         = "false"
    "enable_database_encryption"          = "false"
    "state"                               = "ENCRYPTED"
    "workload_identity_enabled"           = "true"
    "disable_default_snat"                = "false"
    "authenticator_groups_config_enabled" = "false"
    "autoscaling_profile"                 = "OPTIMIZE_UTILIZATION"
    "enable_shielded_nodes"               = "true"
    "gke_backup_agent_config"             = "true"
    "enable_intranode_visibility"         = "false"
  }
}

variable "labels" {
  type        = map(any)
  description = "The resource labels applied to the cluster"
  default = {
    deployed = "terrraform"
  }
}

variable "database_encryption" {
  description = "Application-layer encryption of K8S secrets within Etcd"
  type        = list(object({ state = string, key_name = string }))
  default = [{
    state    = "ENCRYPTED"
    key_name = ""
  }]
}

variable "key_ring" {
  type        = string
  description = "The KeyRing that this key belongs."
  default     = ""
}

variable "key_ring_region" {
  type        = string
  description = "The KeyRing location of the resource."
  default     = "global"
}

variable "key_name" {
  type        = string
  description = "Cryptokey for encrypting the etcd database"
  default     = ""
}

variable "master_authorized_networks_config" {
  description = <<EOF
  The desired configuration options for master authorized networks. Omit the nested cidr_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists)
  ### example format ###
  master_authorized_networks_config = [{
    cidr_blocks = [{
      cidr_block   = "10.0.0.0/8"
      display_name = "example_network"
    }],
  }]

EOF
  type        = list(any)
  default = [{
    cidr_blocks = [{
      cidr_block   = "10.0.0.0/8"
      display_name = "10-0-0-0-8"
      }, {
      cidr_block   = "172.16.0.0/12"
      display_name = "172-16-0-0-12"
      }, {
      cidr_block   = "192.168.0.0/17"
      display_name = "192-168-0-0-17"
    }],
  }]
}

variable "resource_type" {
  type        = list(any)
  description = "Per-cluster configuration of Node Auto-Provisioning with Cluster Autoscaler to automatically adjust the size of the cluster and create/delete node pools based on the current needs of the cluster's workload"
  default = [
    {
      "resource_type"           = "cpu"
      "cluster_autoscaling_max" = "4"
      "cluster_autoscaling_min" = "1"
    },
    {
      "resource_type"           = "memory"
      "cluster_autoscaling_max" = "10"
      "cluster_autoscaling_min" = "1"
    },
  ]
}

variable "suffix" {
  type        = string
  description = "variable to append a string for each resoure to have unique name based on the jenkins branch name."
  default     = ""
}

variable "dependencies" {
  type        = list(any)
  description = "variable reference from other dependency module. Means this module will start creating resource after dependent module was completed."
  default     = []
}

variable "monitoring_components" {
  description = "List of components to enable in monitoring_config"
  type        = list(string)
  default     = ["SYSTEM_COMPONENTS", "APISERVER", "CONTROLLER_MANAGER", "SCHEDULER", "STORAGE", "HPA", "POD", "DAEMONSET", "DEPLOYMENT", "STATEFULSET", "CADVISOR", "KUBELET"]
}
*/