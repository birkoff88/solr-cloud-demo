# Solr Cloud Demo

This project sets up a cloud-native SolrCloud deployment using:

- **Terraform** – Infrastructure provisioning
- **Ansible** – Configuration management
- **Prometheus + Grafana** – Monitoring
- **CI/CD** – Automated deploy pipeline

## Structure

- `terraform/`: Provision VM infrastructure
- `ansible/`: Deploy and configure Solr nodes
- `monitoring/`: Setup for Prometheus & Grafana
- `ci/`: CI/CD automation
- `scripts/`: Helper scripts (certs, cleanup, etc.)

## Requirements

- Terraform >= 1.4
- Ansible >= 2.11
- Docker or cloud provider access
- Python 3

## Quick Start

```bash
cd terraform/
terraform init
terraform apply

