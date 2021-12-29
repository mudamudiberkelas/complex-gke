docker build -t mudamudiberkelas/react-test -f ./client/Dockerfile.dev ./client

docker run -e CI=true mudamudiberkelas/react-test npm test

# Docker Build
docker build -t mudamudiberkelas/multi-client-k8s:latest ./client
docker build -t mudamudiberkelas/multi-server-k8s-pgfix:latest ./server
docker build -t mudamudiberkelas/multi-worker-k8s:latest ./worker

docker push mudamudiberkelas/multi-client-k8s:latest
docker push mudamudiberkelas/multi-server-k8s-pgfix:latest
docker push mudamudiberkelas/multi-worker-k8s:latest:$SHA

# Docker Login
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_ID" --password-stdin

# Take those images and push them to docker hub
docker push mudamudiberkelas/multi-client-k8s:latest
docker push mudamudiberkelas/multi-nginx
docker push mudamudiberkelas/multi-server-k8s-pgfix:latest
docker push mudamudiberkelas/multi-worker-k8s:latest

