# This script has been written for this exercise environment 
# and is not intented to be used in a production enviroment
# execute by: ./mergeconfig.sh

#!/bin/bash
DIR='/home/user/.kube' 
sudo apt install sshpass
sshpass -p Netapp1! scp -o "StrictHostKeyChecking=no" root@rhel3:/root/.kube/config config1 
sshpass -p Netapp1! scp -o "StrictHostKeyChecking=no" root@rhel5:/root/.kube/config config2
sudo sed -i 's/\<kubernetes\>/source/g' config1 
sudo sed -i 's/\<kubernetes\>/destination/g' config2
konfig=$(KUBECONFIG=config1:config2 kubectl config view --flatten)
if [ ! -d "$DIR" ]; then
    mkdir -p $DIR;
fi
echo "$konfig" > $DIR/config
#echo "$konfig" > config
$KUBECONFIG=$DIR/config