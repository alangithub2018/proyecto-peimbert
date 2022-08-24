./Final_Image/MongoCluster/dbstart.sh
docker-compose up -d 
cd Final_Image/ApiMongoDB
docker-compose up -d 
cd ..
./Nginx/init-letsencrypt.sh