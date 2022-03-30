export KUBECONFIG=/home/labri_adm/kube_config_cluster.yml

cd /home/labri_adm/webserver/02/
# cp /home/labri_adm/webserver/02/nginx.conf /etc/nginx/nginx.conf
sleep 3
kubectl apply -k . 