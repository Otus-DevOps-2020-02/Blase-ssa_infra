#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

apt update
apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundler -v
