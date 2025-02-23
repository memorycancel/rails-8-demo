kubectl create configmap rails-master-key --from-literal=rails-master-key=`cat config/master.key`
kubectl get configmap

kubectl apply -f kubernetes/deploy.yaml
# kubectl delete deployments rails-8-demo
kubectl describe deployment rails-8-demo
kubectl logs deployment/rails-8-demo
kubectl get pods -l app=rails-8-demo
# kubectl describe pod rails-8-demo-6ffd78f64-c98bp

kubectl expose deployment/rails-8-demo --type="LoadBalancer" --port 3000
kubectl port-forward service/rails-8-demo 3000:3000

# 清理
kubectl delete deployments rails-8-demo
kubectl delete services rails-8-demo
