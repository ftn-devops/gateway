#  Build all services

#gateway
cd ..
gradle build -x test

cd ../user
gradle build -x test

cd ../accommodation
gradle build -x test

cd ../notification
gradle build -x test

cd ../audit
gradle build -x test

# Start running in the docker
cd ../gateway/environment
docker compose up -d