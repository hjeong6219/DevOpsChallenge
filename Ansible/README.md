# Lab environment for Ansible challenge

This laboratory is based on docker and tries to reproduce a small network environment where you can test your playbooks.

It is based on 3 Ubuntu agents and one server, all interconnected in the same network.

The agents' network names are:
* agent1
* agent2
* agent3

They all have an SSH anabled on port 22 and a user `test` created (with password `test`).

The server is based on Alpine linux and already has all the necessary configurations to successfully connect to the agents. The inventory is defined in the following folder: `server_files/hosts.yml`

It expects you to place Ansible playbook file called `playbook.yml` in the root path of the project.

Example of execution (linux systems):
```bash
bash ansible_stack.sh
```
