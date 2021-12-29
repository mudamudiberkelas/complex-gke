docker build -t mudamudiberkelas/multi-client-k8s:latest-k8s:latest -t mudamudiberkelas/multi-client-k8s:latest-k8s:$SHA -f ./client/Dockerfile ./client
docker build -t mudamudiberkelas/multi-server-k8s-pgfix:latest -t mudamudiberkelas/multi-server-k8s-pgfix:latest-k8s-pgfix:$SHA -f ./server/Dockerfile ./server
docker build -t mudamudiberkelas/multi-worker-k8s:latest-k8s:latest -t mudamudiberkelas/multi-worker-k8s:latest-k8s:$SHA -f ./worker/Dockerfile ./worker

docker push mudamudiberkelas/multi-client-k8s:latest-k8s:latest
docker push mudamudiberkelas/multi-server-k8s-pgfix:latest
docker push mudamudiberkelas/multi-worker-k8s:latest-k8s:latest

docker push mudamudiberkelas/multi-client-k8s:latest-k8s:$SHA
docker push mudamudiberkelas/multi-server-k8s-pgfix:latest-k8s-pgfix:$SHA
docker push mudamudiberkelas/multi-worker-k8s:latest-k8s:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mudamudiberkelas/multi-server-k8s-pgfix:latest-k8s-pgfix:$SHA
kubectl set image deployments/client-deployment client=mudamudiberkelas/multi-client-k8s:latest-k8s:$SHA
kubectl set image deployments/worker-deployment worker=mudamudiberkelas/multi-worker-k8s:latest-k8s:$SHA