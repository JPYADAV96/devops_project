#! /bin/bash
# shellcheck disable=SC2164
cd /home/ubuntu
yes | sudo apt update
yes | sudo apt install python3 python3-pip
git clone https://github.com/JPYADAV96/python-mysql-db-proj-1.git
sleep 20
# shellcheck disable=SC2164
cd python-mysql-db-proj-1


# Install necessary packages for installing Docker over HTTPS
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list to include Docker packages
sudo apt-get update

# Install Docker Engine, CLI, and containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io


# Optional: Add the current user to the docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Print a success message
echo "Docker has been installed successfully. Please log out and log back in to apply group changes if you added yourself to the docker group."

#sudo chmod 666 /var/run/docker.sock

docker build -t flask-app .


docker run -d -p 5000:5000 flask-app:latest