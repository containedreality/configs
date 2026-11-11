#!/bin/sh
apt-get install -y python3-netifaces python3-aioquic python3-pycryptodome python-is-python3
git clone --depth=1 https://github.com/lgandx/Responder /opt/responder