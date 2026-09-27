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

The Oracle 19c container image is not included in this repository and has not yet been deployed.

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
- Oracle container configuration variables
- Oracle image availability detection
- Conditional preparation for Oracle deployment

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

- Build the Oracle Database 19c container image from Oracle-provided installation media
- Deploy the Oracle container through Ansible
- Add container health and database connectivity checks
- Provision infrastructure with Terraform
- Integrate Terraform and Ansible workflows
- Add CI validation for Terraform and Ansible
- Expand documentation and architecture diagrams

## Security

Database passwords, private keys, Terraform state, Oracle installation media, and other sensitive files are excluded from source control.

Oracle software and installation media are not distributed through this repository.
