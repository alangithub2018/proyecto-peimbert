echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker.io 
sudo apt-get install docker-compose
sudo apt install git -y
cd /
rm -R /proyecto/
sudo mkdir -p /proyecto/peimbert
cd /proyecto/peimbert
git clone https://github.com/alangithub2018/proyecto-peimbert.git
cd /proyecto/peimbert/proyecto-peimbert/Final_Image
chmod 777 -R /proyecto/

docker-compose up -d
cd /proyecto/peimbert/proyecto-peimbert/Final_Image/MongoCluster/
sleep 5
chmod a+x rs-init.sh 
docker exec mongo1 /scripts/rs-init.sh
cd /proyecto/peimbert/proyecto-peimbert/Final_Image
docker-compose -f /proyecto/peimbert/proyecto-peimbert/Final_Image/docker-compose-api.yml up -d
chmod a+x /proyecto/peimbert/proyecto-peimbert/Final_Image/Nginx/init-letsencrypt.sh
./proyecto/peimbert/proyecto-peimbert/Final_Image/Nginx/init-letsencrypt.sh
cd /proyecto/peimbert/proyecto-peimbert/Final_Image/Nginx
./init-letsencrypt.sh