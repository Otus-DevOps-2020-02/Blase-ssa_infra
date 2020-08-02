#!/bin/bash
useradd -m -r -s /bin/bash puma
cd ~puma/
sudo -u puma git clone -b monolith https://github.com/express42/reddit.git
cd ~puma/reddit/
sudo bundler install
#sudo -u puma puma -d
