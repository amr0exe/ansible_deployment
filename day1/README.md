# Ansible Deployment

This project deploys a jinja template with vars to nginx container on target nodes.

# Run
- clone the repo: `git clone repo_url`
- run the playbook: `ansible-playbook site.yml`

# Project Strcuture
```bash
  # major files/folder to lookout for
  \
  | ansible.config          # contains path to roles, init, etc.
  | site.yml                # playbook calling roles        
  | requirements.yml        # required roles
  | inventor.ini            # target address
  |
  | \roles
  |      | webserver
  |      |      | tasks/main.yml            # tasks to run on a playbook
  |      |      | handlers/main.yml         # handler called by nginx
  |      |      | templates/index.html.j2   # jinja template
  |      |      | vars/main.yml             # contains variable used on template
  |      |      |
  
```

## Output Screenshots

<img width="1687" height="725" alt="Image" src="https://github.com/user-attachments/assets/39fca264-5086-4ae4-8d57-c07a24385cb1" />

<img width="1687" height="725" alt="Image" src="https://github.com/user-attachments/assets/5e72b302-14d1-40d1-984e-700d61f5c583" />
