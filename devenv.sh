#!/bin/bash
# SPDX-FileCopyrightText: 2024 Markus Katharina Brechtel <markus.katharina.brechtel@thengo.net>
# SPDX-License-Identifier: Apache-2.0

# Check if container already exists
if podman ps -a --filter name=checker-devenv --format "{{.Names}}" | grep -q "^checker-devenv$"; then
    echo "Container 'checker-devenv' already exists, starting it..."
    podman start -ai checker-devenv
else
    echo "Building image 'checker-devenv'..."
    podman build -t checker-devenv -f Containerfile .
    
    echo "Creating new container 'checker-devenv'..."
    podman run --name checker-devenv --hostname checker-devenv -it -v ./:/mnt/checker:rw checker-devenv /lib/systemd/systemd
fi
