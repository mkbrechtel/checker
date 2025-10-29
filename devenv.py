#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2024 Markus Katharina Brechtel <markus.katharina.brechtel@thengo.net>
# SPDX-License-Identifier: Apache-2.0

import subprocess
import sys


def container_exists(name):
    """Check if a container with the given name exists."""
    result = subprocess.run(
        ["podman", "ps", "-a", "--filter", f"name={name}", "--format", "{{.Names}}"],
        capture_output=True,
        text=True
    )
    return f"^{name}$" in result.stdout


def main():
    container_name = "checker-devenv"
    
    if container_exists(container_name):
        print(f"Container '{container_name}' already exists, starting it...")
        subprocess.run(["podman", "start", "-ai", container_name])
    else:
        print(f"Building image '{container_name}'...")
        subprocess.run(["podman", "build", "-t", container_name, "-f", "Containerfile", "."])
        
        print(f"Creating new container '{container_name}'...")
        subprocess.run([
            "podman", "run",
            "--name", container_name,
            "--hostname", container_name,
            "-it",
            "-v", "./:/mnt/checker:rw",
            container_name,
            "/lib/systemd/systemd"
        ])


if __name__ == "__main__":
    main()