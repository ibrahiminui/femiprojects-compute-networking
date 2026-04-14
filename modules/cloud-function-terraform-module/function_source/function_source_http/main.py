import re
import json


def validate_input(request):
    try:
        data = request.get_json(silent=True)
    except Exception:
        data = None

    if not data:
        return (
            json.dumps({"error": "Invalid JSON payload"}),
            400,
            {"Content-Type": "application/json"},
        )

    email = data.get("email")

    if email is None:
        return (
            json.dumps({"error": "Missing required field: email"}),
            400,
            {"Content-Type": "application/json"},
        )

    if not isinstance(email, str):
        return (
            json.dumps({"error": "Email must be a string"}),
            400,
            {"Content-Type": "application/json"},
        )

    if len(email) > 254:
        return (
            json.dumps({"error": "Email exceeds max length"}),
            400,
            {"Content-Type": "application/json"},
        )

    pattern = r"^[\w\.-]+@[\w\.-]+\.\w+$"
    if not re.match(pattern, email):
        return (
            json.dumps({"error": "Invalid email format"}),
            400,
            {"Content-Type": "application/json"},
        )

    return (
        json.dumps({"message": "Valid input"}),
        200,
        {"Content-Type": "application/json"},
    )
