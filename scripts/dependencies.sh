#!/bin/sh
set -eu

apk update && \
apk add coreutils \
        curl \
        docker \
        go \
        shadow

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
rm kubectl

curl -LO https://github.com/kubernetes-sigs/kind/releases/download/v0.14.0/kind-linux-amd64 && \
chmod +x ./kind-linux-amd64 && \
mv ./kind-linux-amd64 /usr/local/bin/kind

usermod -aG docker vagrant

rc-update add docker default

reboot

