#!/bin/bash
set -e

# create network for the lab
docker network create ansible-lab-network || true

# build base image for agents
docker build -f server_files/Dockerfile -t ubuntu_agent .

# create some agents
docker run -d \
  --network=ansible-lab-network \
  --name agent1 \
  ubuntu_agent

docker run -d \
  --network=ansible-lab-network \
  --name agent2 \
  ubuntu_agent

docker run -d \
  --network=ansible-lab-network \
  --name agent3 \
  ubuntu_agent

# container for Ansible server
docker run \
  --network=ansible-lab-network \
  --name server \
  -v "$(pwd)"/server_files/ansible.cfg:/etc/ansible/ansible.cfg \
  -v "$(pwd)"/server_files/hosts.yml:/etc/ansible/hosts.yml \
  -v "$(pwd)"/agent_files/:/etc/ansible/agent_files/ \
  -v "$(pwd)"/playbook.yml:/etc/ansible/playbook.yml \
  epicsoft/ansible:latest \
  sh -c "ansible-playbook /etc/ansible/playbook.yml"

# example of connection from inside the server to one of the containers
# ssh -o StrictHostKeyChecking=no test@agent1
# password = test

# clean up procedure
docker stop agent1 agent2 agent3
docker rm agent1 agent2 agent3 server
docker rmi ubuntu_agent
docker network rm ansible-lab-network
