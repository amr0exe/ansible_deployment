# Ansible Deploy

This playbook pull docker-image from ECR registry and runs its on docker_container on target server

## Run

```bash
ansible-playbook site.yml -e "aws_account_id=your_account_id"
```
