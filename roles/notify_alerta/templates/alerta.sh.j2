#!/bin/bash

set -e

# Default Alerta API settings
ALERTA_API_ALERT_URL=${ALERTA_API_URL:-"http://localhost:8080/api/alert"}
ALERTA_API_KEY=${ALERTA_API_KEY:-"EUeDlg7Ro4tKlOMW5-v5nMnTa08F1atbRIvavs3-"}
ALERTA_ENVIRONMENT=${ALERTA_ENVIRONMENT:-"Development"}

# Parse arguments
hostname="$1"
check_id="$2"
exit_code="$3"


# Map exit code to severity
case $exit_code in
    0) severity="ok" ;;
    1) severity="warning" ;;
    2) severity="critical" ;;
    3) severity="unknown" ;;
    *) severity="debug" ;;
esac

cat \
| jo \
    text=@- \
    resource="$hostname" \
    event="$check_id" \
    environment="$ALERTA_ENVIRONMENT" \
    severity="$severity" \
    value="$exit_code" \
    service="[\"$hostname\"]" \
    origin=checker \
    type=checkerCheck \
| curl -s \
    -X POST \
    -H "Authorization: Key $ALERTA_API_KEY" \
    -H "Content-Type: application/json" \
    -d @- \
    --fail-with-body \
    "$ALERTA_API_ALERT_URL"
