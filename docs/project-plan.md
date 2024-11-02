# Monitoring System with Ansible and Alerta

## Project Description
This Ansible role automates the setup of a monitoring system on Debian servers. It installs and configures SystemD units that execute monitoring scripts at defined intervals. These scripts check various system parameters and report their results via the Alerta API or other alerting mechanisms. The system combines the simplicity of Nagios-like checks with modern scheduling through SystemD and flexible alerting options.

### Core Features
- Automated deployment of monitoring checks via Ansible
- Scheduling via SystemD Timer Units
- Flexible monitoring scripts
- Centralized alerting via Alerta API or other notification systems
- Standardized error handling

### Monitoring Checks
1. Failed SystemD Units Check
   - Checks all SystemD units for failed status
   - Detects units in failed state via `systemctl --failed`
   - Reports details of failed units
   - Hourly execution

2. Disk Space Monitor
   - Volumes are defined via Ansible configuration
   - Checks available disk space via df
   - Warning at 80% usage
   - Critical at 90% usage
   - Daily execution

3. Package Update Monitor
   - Detection of performed system updates
   - Analysis of APT log and dpkg.log
   - Check for recently updated packages
   - Daily execution

## Development Plan

### 1. Basic Framework
- Set up Ansible role structure
- Define main variables
- Create basic tasks for package installation
- Implement SystemD unit templates
- Volume configuration for disk monitoring

### 2. Check Development
- Development of monitoring scripts
- Integration of alerting systems (Alerta API and other options)
- Implementation of error handling logic
- Definition of output format
- Development of three basic checks:
  * SystemD Unit Monitor
  * Disk Space Check
  * Package Update Detector

### 3. Deployment & Integration
- Ansible tasks for deployment
- Configuration management
- Service management
- Timer unit configuration for various intervals

### 4. Tests & Documentation
- Functional tests
- Integration tests
- Creation of README
- Example configurations
- Test scenarios for all check types

## Deliverables
- Ansible role
- SystemD unit templates
- Three basic check scripts
- Documentation
- Example configuration
