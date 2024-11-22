echo "############################################"
echo "###      Trident Protect install         ###"
echo "############################################"

kubectl create ns trident-protect

PROTECTVERSION=100.2410.0

helm repo add netapp-trident-protect https://netapp.github.io/trident-protect-helm-chart

helm install trident-protect-crds netapp-trident-protect/trident-protect-crds --version $PROTECTVERSION

helm install trident-protect netapp-trident-protect/trident-protect \
    --version $PROTECTVERSION      \
    --namespace trident-protect    \
    --create-namespace  
  
#kubectl patch deployments -n trident-protect trident-protect-controller-manager -p '{"spec": {"template": {"spec": {"nodeSelector": {"kubernetes.io/os": "linux"}}}}}'