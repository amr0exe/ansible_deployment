# AWS High-Availability Web Cluster

Automated provisioning of load-balanced, containerized Nginx application across multi-AZ EC2 instance using Ansible, Docker, AWS ALB, Docker, Route 53 with ACM cert.

## Tasks
- Route 53 hosted zone, ACM cert, A record  mapped to ALB
- ALB load-balancer, target groups to ec2 instances
- deployment to ec2 with ansible playbook [link](../day2/)
  - ansible playbook deploys zipped site on nginx docker

## Region (mumbai)
<div align="center">
<img width="746" height="108" alt="Image" src="https://github.com/user-attachments/assets/3f35f10d-66dc-4689-927d-14c23ce794b7" />
</div>

## Route 53
<img width="2190" height="960" alt="Image" src="https://github.com/user-attachments/assets/bdd76f51-7958-4991-aa70-57a1626e1324" />

## Load Balancer
<img width="2139" height="987" alt="Image" src="https://github.com/user-attachments/assets/5e1a1bff-dd0b-45bf-a926-f9c9a2b337a8" />

## Target Groups
<img width="2156" height="1012" alt="Image" src="https://github.com/user-attachments/assets/f8146cb8-4f55-434e-88cd-54991c22afd8" />


## Final (padlock showing https)
<div align="center">
<img width="1155" height="626" alt="Image" src="https://github.com/user-attachments/assets/bd803a05-c32d-4ff8-b616-81ed8c56c4ae" />
</div>
