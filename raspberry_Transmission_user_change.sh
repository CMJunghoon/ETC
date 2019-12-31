sudo /etc/init.d/transmission-daemon stop

sudo chown -R coolmint:coolmint /etc/transmission-daemon
sudo rm -rf ~coolmint/.config/transmission-daemon
sudo mv /etc/transmission-daemon ~coolmint/.config/
sudo ln -s ~coolmint/.config/transmission-daemon /etc/transmission-daemon

sudo chown coolmint:coolmint /etc/default/transmission-daemon
sudo mv /etc/default/transmission-daemon ~coolmint/.config/transmission-daemon/transmission-daemon-default
sudo ln -s ~coolmint/.config/transmission-daemon/transmission-daemon-default /etc/default/transmission-daemon

sudo chown coolmint:coolmint /etc/init.d/transmission-daemon
sudo sed -i 's/USER=debian-transmission/USER=coolmint/g' /etc/init.d/transmission-daemon
sudo mv /etc/init.d/transmission-daemon ~coolmint/.config/transmission-daemon/transmission-daemon-init
sudo ln -s ~coolmint/.config/transmission-daemon/transmission-daemon-init /etc/init.d/transmission-daemon

sudo /etc/init.d/transmission-daemon start