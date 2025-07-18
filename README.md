# checker

A lightweight monitoring system that combines systemd timers with Nagios-compatible check plugins, deployed via Ansible.

## Overview

This Ansible collection provides a simple yet powerful monitoring framework that:
- Uses systemd timers for reliable scheduling
- Runs standard Nagios monitoring plugins
- Sends notifications via email (sendmail) and Alerta API
- Provides resource limits and security hardening per check
- Includes a real-time monitoring dashboard

## Features

- **Modular Design**: Easy to add new checks and notification methods
- **Production Ready**: Includes error handling, timeouts, and resource limits
- **Systemd Integration**: Leverages systemd for scheduling, logging, and process management
- **Nagios Compatible**: Works with thousands of existing monitoring plugins
- **Multiple Notifiers**: Email and Alerta support with parallel execution
- **Resource Control**: Per-check CPU, memory, and timeout limits
- **Security**: Runs with minimal privileges using systemd sandboxing

## Quick Start

```bash
# Deploy the monitoring system
ansible-playbook local.yaml

# View monitoring dashboard
checker-monitor

# Check systemd timers
systemctl list-timers 'checker-*'
```

## Architecture

The system consists of:
- **Checks**: Individual monitoring scripts in `/etc/checker/checks/`
- **Timers**: Systemd timers that trigger checks on schedule
- **Notifiers**: Scripts that send alerts via various channels
- **Output Files**: Check results stored in `/run/checker/`

## Available Roles

### Core
- `checker` - Base infrastructure and scripts
- `check` - Generic role for deploying checks

### Checks
- `check_systemd` - Monitor failed systemd units
- `check_disk` - Disk space monitoring
- `check_memory` - Memory usage monitoring
- `check_ping` - Network connectivity checks

### Meta Roles
- `system_checks` - Groups system-related checks
- `disk_checks` - Automatically monitors all mount points
- `network_checks` - Network monitoring checks

### Notifiers
- `notify_email` - Email notifications via sendmail
- `notify_alerta` - Alerta API integration

## Configuration

Each check can be configured with:
- **Scheduling**: Via systemd timer (minutely, hourly, etc.)
- **Resource Limits**: CPU quota, memory max, timeout
- **Thresholds**: Warning and critical levels
- **Custom Variables**: Check-specific settings

Example check configuration in `check.env`:
```bash
CHECK_TIMEOUT=30
CHECK_MEMORY_MAX=50M
CHECK_CPU_QUOTA=10%
CHECK_LIMIT_NOFILE=1024
CHECK_LIMIT_NPROC=32
```

## Documentation

See the `/docs` directory for:
- `install.md` - Installation guide
- `configuration.md` - Detailed configuration reference
- `performance.md` - Performance tuning guide

## License

This collection is provided as-is for production use.