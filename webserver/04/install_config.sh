export KUBECONFIG=/home/labri_adm/kube_config_cluster.yml

cd /home/labri_adm/webserver/04/

kubectl create namespace cert-manager

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.1/cert-manager.crds.yaml


helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager --version v1.5.1 \
  --set http_proxy=http://${proxy_host} \
  --set https_proxy=http://${proxy_host} \
  --set no_proxy=127.0.0.0/8\\,10.0.0.0/8\\,cattle-system.svc\\,172.16.0.0/12\\,192.168.0.0/16\\,.svc\\,.cluster.local

  kubectl create namespace cattle-system


helm upgrade --install rancher rancher-latest/rancher \
   --namespace cattle-system \
   --set hostname=cltrke.labriunesp.org \
   --set proxy=http://${proxy_host} \
   --set noProxy=127.0.0.0/8\\,10.0.0.0/8\\,cattle-system.svc\\,172.16.0.0/12\\,192.168.0.0/16\\,.svc\\,.cluster.local