#!/bin/bash

# Default Alerta API settings
ALERTA_API_URL=${ALERTA_API_URL:-"http://localhost:8080/api"}
ALERTA_API_KEY=${ALERTA_API_KEY:-"EUeDlg7Ro4tKlOMW5-v5nMnTa08F1atbRIvavs3-"}

# Ensure required environment variables
if [ -z "$ALERTA_API_KEY" ]; then
    echo "Error: ALERTA_API_KEY environment variable must be set" >&2
    exit 1
fi

# Read check output from stdin
output=$(cat)

# Parse arguments
hostname="$1"
check_id="$2"
exit_code="$3"

echo hostname $hostname check_id $check_id exit_code $exit_code

# Map exit code to severity
case $exit_code in
    0) severity="ok" ;;
    1) severity="warning" ;;
    2) severity="critical" ;;
    3) severity="unknown" ;;
    *) severity="debug" ;;
esac

# Convert hostname and check_id into resource and event names
resource="${hostname}"
event="${check_id}"

# Create JSON payload
json_payload=$(cat << EOF
{
    "resource": "$resource",
    "event": "$event",
    "environment": "Production",
    "severity": "$severity",
    "service": ["monitoring"],
    "group": "System",
    "value": "$exit_code",
    "text": "$output",
    "type": "checkerAlert",
    "attributes": {
        "checkId": "$check_id"
    },
    "origin": "checker/$hostname",
    "timeout": 86400
}
EOF
)

# Send alert to Alerta
response=$(curl -s -X POST "$ALERTA_API_URL/alert" \
    -H "Authorization: Key $ALERTA_API_KEY" \
    -H "Content-type: application/json" \
    -d "$json_payload")

echo "Got response from alerta: $response"

exit 0
