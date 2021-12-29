docker build -t mudamudiberkelas/react-test -f ./client/Dockerfile.dev ./client

docker run -e CI=true mudamudiberkelas/react-test npm test

# Docker Build
docker build -t mudamudiberkelas/multi-client ./client
docker build -t mudamudiberkelas/multi-nginx ./nginx
docker build -t mudamudiberkelas/multi-server ./server
docker build -t mudamudiberkelas/multi-worker ./worker

# Docker Login
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_ID" --password-stdin

# Take those images and push them to docker hub
docker push mudamudiberkelas/multi-client
docker push mudamudiberkelas/multi-nginx
docker push mudamudiberkelas/multi-server
docker push mudamudiberkelas/multi-worker

