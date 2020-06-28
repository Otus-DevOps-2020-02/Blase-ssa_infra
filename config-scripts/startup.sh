#!/bin/bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xd68fa50fea312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt update
apt install -y ruby-full ruby-bundler build-essential mongodb-org
systemctl start mongod
systemctl enable mongod
useradd -m -r -s /bin/bash appuser
cd ~appuser/
sudo -u appuser git clone -b monolith https://github.com/express42/reddit.git
cd ~appuser/reddit/
bundler install
sudo -u appuser puma -d
