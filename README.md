# Oracle 19c Podman DevOps Lab

A hands-on DevOps lab for deploying and managing Oracle Database 19c using Terraform, Ansible, Podman, and Red Hat Enterprise Linux.

## Project Goals

This project demonstrates a layered infrastructure and automation approach:

- Terraform for infrastructure provisioning and state management
- Ansible for host configuration and deployment automation
- Podman for rootless container management
- Oracle Database 19c as the target database workload
- Git and GitHub for source control and change tracking

## Architecture

```text
Terraform
    |
    v
Infrastructure / VM
    |
    v
Ansible
    |
    v
Red Hat Enterprise Linux 9
    |
    v
Rootless Podman
    |
    v
Oracle Database 19c
    |
    v
Persistent Oracle Storage

```

## Current Lab Environment

The initial development environment uses a manually created RHEL 9.8 virtual machine.

Current components:

- Red Hat Enterprise Linux 9.8
- Terraform 1.16.4
- Ansible Core 2.14
- Podman 5.8
- Rootless Podman
- Git/GitHub
- Persistent Oracle data directory
- SELinux-compatible container storage

The Oracle 19c container image has been successfully built and deployed using rootless Podman.

Current database configuration:

- Container: `oracle19c`
- CDB: `ORCLCDB`
- PDB: `DEV`
- Oracle Listener: port `1521`
- EM Express: port `5500`
- Persistent database storage: `~/oracle-data/oradata`

The Oracle installation media and resulting container image are not distributed through this repository.

## Repository Structure

```text
oracle-podman-lab/
├── ansible/
│   ├── inventory/
│   ├── playbooks/
│   └── roles/
├── containers/
│   └── oracle19c/
├── docs/
├── scripts/
├── terraform/
├── ansible.cfg
├── .gitignore
└── README.md
```

## Ansible

Ansible currently prepares the host and Oracle container environment.

Implemented automation includes:

- Podman package validation and installation
- Rootless Podman verification
- Oracle persistent storage directory creation
- Rootless Podman UID/GID ownership mapping
- SELinux-compatible persistent storage
- Oracle container configuration variables
- Oracle image availability detection
- Oracle 19c container deployment
- Oracle container resource limits (`nofile`, `nproc`, and `stack`)
- Oracle Listener port mapping on `1521`
- EM Express HTTPS port mapping on `5500`

## Oracle Monitoring

### Enterprise Manager Express

Oracle Enterprise Manager Express has been enabled and validated for the containerized Oracle 19c database.

Current monitoring configuration:

- CDB: `ORCLCDB`
- PDB: `DEV`
- EM Express HTTPS port: `5500`
- Container port exposed to the RHEL host
- Database health, sessions, SQL activity, performance, and storage can be monitored through EM Express

### Enterprise Manager Cloud Control 13.5

A separate Oracle Linux 8.10 virtual machine, `oemserver`, is being configured as the centralized Oracle monitoring server.

Repository database configuration:

- Oracle Database 19c Enterprise Edition 19.32
- CDB: `EMREP`
- Repository PDB: `EMPDBREPOS`
- Oracle Listener: port `1521`
- OEM repository database prerequisite checks successfully validated
- Oracle Enterprise Manager Cloud Control 13.5 installation in progress

The goal is to use OEM Cloud Control to provide centralized monitoring, alerting, incident management, and performance analysis for the Oracle lab environment.

## Terraform

Terraform currently demonstrates the infrastructure-as-code workflow and state lifecycle.

Implemented functionality includes:

- Terraform version requirements
- Input variables
- Local values and reusable labels
- Outputs
- Terraform state management
- A `terraform_data` resource representing lab metadata

Future Terraform work will provision infrastructure rather than treating the manually created development VM as Terraform-managed infrastructure.

## Persistent Storage

Oracle database files are designed to persist outside the container.

Host location:

```text
~/oracle-data/oradata
```

Container location:

```text
/opt/oracle/oradata
```

The bind mount has been validated with rootless Podman and SELinux labeling.

## Planned Work

- Complete Oracle Enterprise Manager Cloud Control 13.5 installation
- Discover and register the containerized Oracle 19c database as an OEM target
- Validate OEM database metrics, alerts, incidents, and performance monitoring
- Test centralized OEM monitoring against EM Express
- Add automated Oracle database and container health checks
- Expand Ansible automation for Oracle lifecycle management
- Provision lab infrastructure with Terraform
- Integrate Terraform and Ansible workflows
- Add CI validation for Terraform and Ansible
- Expand troubleshooting and architecture documentation

## Security

Database passwords, private keys, Terraform state, Oracle installation media, and other sensitive files are excluded from source control.

Oracle software and installation media are not distributed through this repository.
