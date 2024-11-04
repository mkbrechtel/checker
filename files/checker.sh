#!/bin/bash

# Ensure required variables are set
if [ -z "$1" ]; then
    echo "Error: Usage: $0 <run_file>" >&2
    exit 9
fi

RUN_FILE="$1"

# Run check and tee output, using PIPESTATUS to get check.sh's exit code
./check.sh 2>&1 | tee "${RUN_FILE}"
exit ${PIPESTATUS[0]}
