echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf



sudo iptables -t nat -A POSTROUTING -o tailscale0 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE


sudo iptables -A INPUT -i tailscale0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -i ens5 -m state --state RELATED,ESTABLISHED -j ACCEPT


sudo iptables -A FORWARD -j ACCEPT










sudo iptables -A FORWARD -i tailscale0 -o ens5 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i ens5 -o tailscale0 -j ACCEPT
