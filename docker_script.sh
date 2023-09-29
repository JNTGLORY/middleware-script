#!/bin/bash
echo -e "\n let install docker ...\n"

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

echo -e "\n let Update the system...\n"
sudo yum update -y

# Install required packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Add Docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE
sudo yum install -y docker-ce

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add the current user to the docker group (optional, to run Docker without sudo)
usermod -aG docker $USER

# Display Docker version
docker --version





echo "Docker has been installed and started. You may need to log out and back in to use Docker without 'sudo'."

