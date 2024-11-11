This role implements disk space monitoring using the Nagios check_disk plugin. Here's how to use it:

Key features:
- Uses Nagios check_disk plugin for reliable disk space monitoring
- Configurable warning and critical thresholds (supports both percentage and absolute values)
- Multiple path monitoring
- Filesystem type inclusion/exclusion
- Local-only filesystem option
- Customizable check interval
- Systemd timer-based scheduling
- Integration with the base checker framework

Configuration options:
- `check_disk_warning`: Warning threshold (default: 20%)
- `check_disk_critical`: Critical threshold (default: 10%)
- `check_disk_paths`: List of paths to monitor (required)
- `check_disk_exclude_types`: Filesystem types to exclude
- `check_disk_include_types`: Filesystem types to include
- `check_disk_local_only`: Only check local filesystems (default: true)
- `check_disk_timeout`: Check timeout in seconds (default: 30)
- `check_disk_units`: Units for reporting (default: MB)
- `check_id`: Identifier for the check (default: "disk")

