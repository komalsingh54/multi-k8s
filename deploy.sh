docker build -t komalsingh54/multi-client:latest -t komalsingh54/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t komalsingh54/multi-server:latest -t komalsingh54/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t komalsingh54/multi-worker:latest -t komalsingh54/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push komalsingh54/multi-client:latest
docker push komalsingh54/multi-server:latest
docker push komalsingh54/multi-worker:latest

docker push komalsingh54/multi-client:$SHA
docker push komalsingh54/multi-server:$SHA
docker push komalsingh54/multi-worker:$SHA

kubectl apply -f K8S
kubectl set image deployments/server-deployments server=komalsingh54/multi-server:$SHA
kubectl set image deployments/client-deployments server=komalsingh54/multi-client:$SHA
kubectl set image deployments/worker-deployments server=komalsingh54/multi-worker:$SHA
