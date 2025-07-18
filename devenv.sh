#!/bin/bash

# Build image
podman build -t checker-devenv -f Containerfile .

podman run --rm -it -v ./:/mnt/checker:rw checker-devenv /lib/systemd/systemd
