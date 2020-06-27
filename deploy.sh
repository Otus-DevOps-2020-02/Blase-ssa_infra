#!/bin/bash
cd ~
git clone -b monolith https://github.com/express42/reddit.git
cd reddit/
bundler install
puma -d
ps aux |grep puma
