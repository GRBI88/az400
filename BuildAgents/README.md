### Create linux server

> Version should be updated

```bash

SERVERNAME="az400server1"
POOLNAME="az400pool"

multipass launch --name $SERVERNAME --disk 30G --memory 4G --cpus 2

multipass shell $SERVERNAME

## RUN VARS AGAIN

sudo apt update
sudo apt upgrade -y

mkdir agent && cd agent

wget https://download.agent.dev.azure.com/agent/4.258.1/vsts-agent-linux-x64-4.258.1.tar.gz

tar zxvf vsts-agent-linux-x64-4.258.1.tar.gz


./config.sh --unattended \
  --url https://dev.azure.com/integration-it-teaching \
  --auth pat \
  --token 4pEdX...... \
  --pool $POOLNAME \
  --agent local-ubuntu-$SERVERNAME \
  --acceptTeeEula

## Install Azure CLI

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

./run.sh


```