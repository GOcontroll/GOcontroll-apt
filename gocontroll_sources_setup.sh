#!/bin/bash

apt-get install -y gpg

mkdir -p /usr/share/keyrings

rm -f /usr/share/keyrings/gocontroll.gpg || true
rm -f /etc/apt/sources.list.d/gocontroll.list || true

curl -fsSL http://server.gocontroll.com/gpg-pubkey.asc | gpg --dearmor -o /usr/share/keyrings/gocontroll.gpg

chmod 644 /usr/share/keyrings/gocontroll.gpg

echo "deb [signed-by=/usr/share/keyrings/gocontroll.gpg] http://server.gocontroll.com/ bookworm main" | tee /etc/apt/sources.list.d/gocontroll.list > /dev/null

apt-get update -y
