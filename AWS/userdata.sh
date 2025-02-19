#!/bin/bash
set -ex

# Update the system
apt-get update -y
apt-get upgrade -y

# Install Java (Jenkins requirement)
apt-get install -y openjdk-17-jdk

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io-2023.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update -y
apt-get install -y jenkins

# Start and enable Jenkins service
systemctl enable jenkins
systemctl start jenkins

# Install Docker
apt-get install -y docker.io

# Enable and start Docker service
systemctl enable docker
systemctl start docker

# Add Jenkins user to Docker group
usermod -aG docker jenkins

# Restart Jenkins and Docker to apply changes
systemctl restart jenkins
systemctl restart docker

# Print completion message
echo "Jenkins and Docker installation complete."
