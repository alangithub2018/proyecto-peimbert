apt-get update
apt-get install ca-certificates curl gnupg lsb-release -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com>

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o />
chmod +x /usr/local/bin/docker-compose

wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64  -O /usr/local/bin/ctop
chmod +x /usr/local/bin/ctop