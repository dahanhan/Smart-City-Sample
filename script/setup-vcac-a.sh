#!/bin/bash -e

# setup host docker swarm if not already
sudo docker swarm leave --force 2> /dev/null
sudo docker swarm init --advertise-addr=172.32.1.254 2> /dev/null || echo
JOINCMD=$(sudo docker swarm join-token worker | grep token)

# setup VCAC-A passwordless access
echo "Login to VACA-A once to establish passwordless access"
if test ! -f ~/.ssh/id_rsa; then
    cat /dev/zero | ssh-keygen -q -N ""
    echo
fi
NODEUSER="root"
NODEIP="172.32.1.1"
ssh-copy-id $NODEUSER@$NODEIP 2> /dev/null || echo
echo

# setup node to join the host docker swarm 
ssh $NODEUSER@$NODEIP "docker swarm leave --force 2> /dev/null;$JOINCMD"