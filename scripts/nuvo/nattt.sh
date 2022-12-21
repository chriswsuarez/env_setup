#!/bin/bash

## Internet connection shating script

sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -p
sudo iptables -X
sudo iptables -F
sudo iptables -t nat -X
sudo iptables -t nat -F
sudo iptables -t nat -A POSTROUTING -o wlp16s0 -j MASQUERADE
sudo iptables -A FORWARD -i br0 -o wlp16s0 -j ACCEPT
sudo iptables -A FORWARD -i wlp16s0 -o br0 -m state --state RELATED,ESTABLISHED -j ACCEPT