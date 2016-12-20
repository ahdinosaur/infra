sudo apt-get update
sudo apt-get install git python-pip bridge-utils -y
sudo pip install --upgrade pip
sudo pip install -U os-testr

sudo -u vagrant -s -- <<EOF
cd /home/vagrant
git clone https://git.openstack.org/openstack-dev/devstack
cd devstack
git checkout stable/newton
cat > ./local.conf <<FOE
[[local|localrc]]
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=\$ADMIN_PASSWORD
RABBIT_PASSWORD=\$ADMIN_PASSWORD
SERVICE_PASSWORD=\$ADMIN_PASSWORD
RECLONE=yes
FOE
EOF
