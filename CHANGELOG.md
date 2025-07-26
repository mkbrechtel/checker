# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Reorganized file structure by moving files from global `files/` directory to their appropriate roles
  - Moved checker.py, checker.sh, checker-monitor.py, checker-monitor.sh, notify.py, notify.sh to `roles/checker/files/`
  - Moved systemd unit files to `roles/checker/files/systemd/`
  - Moved dir-readme files to `roles/checker/files/dir-readme/`
  - Moved notify-alerta.py, notify-alerta.sh to `roles/notify_alerta/files/`
  - Moved notify-email.py, notify-email.sh to `roles/notify_email/files/`
- Removed global `files/` directory to improve Ansible collection compatibility