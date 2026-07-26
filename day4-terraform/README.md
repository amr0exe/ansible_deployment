
# Terraform - Static Site deploy

Provisions two EC2 instances behind and ALB, serving a static site over HTTPS at `demo.amritthapa183.com.np`.

## HLD
```bash

        CLIENT ⟹ Route53(alias)
            ⇓
        ALB (:443, :80 ⟹ :443)
            ⇓
        Target Group
            ⇓
        EC2(x2, shared SG)
 
```

## Tasks
- spinup two `ec2` instances ["t3.micro", "unified_security_group"]
  - deploy site with ansible-playbook [link](../day2/)

- create `alb`, listening on `443`, `80`
  - target group attaching two `ec2`'s
  - link existing `acm` certificate for https

- create alias record to load balancer in hosted zone
  - edit `alb` to redirect from http to https, replacing forward to `:80`

## Setup
- Override variables in `variables.tf`
  ```hcl
  region = "ap-south-1"
  key_name = "your_keypair_name"
  domain = "your_hostedzone_domain"
  ```

- test it locally
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```
