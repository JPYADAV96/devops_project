#! /bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Update and install necessary packages
cd /home/ubuntu
yes | sudo apt update
yes | sudo apt install -y python3 python3-pip

# Clone the repository
if ! git clone https://github.com/JPYADAV96/python-mysql-db-proj-1.git; then
    echo "Failed to clone repository!"
    exit 1
fi

sleep 20

cd python-mysql-db-proj-1

# Install necessary packages for Docker
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
if ! curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; then
    echo "Failed to add Docker's GPG key!"
    exit 1
fi

# Set up the stable Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list to include Docker packages
sudo apt-get update

# Install Docker Engine, CLI, and containerd
if ! sudo apt-get install -y docker-ce docker-ce-cli containerd.io; then
    echo "Failed to install Docker!"
    exit 1
fi

# Add the current user to the docker group (ensure user re-login is required)
sudo chmod 666 /var/run/docker.sock


# Build Docker image
sudo docker build -t flask-app .
# Run Docker container
sudo docker run -d -p 5000:5000 flask-app:latest

