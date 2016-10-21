#!/bin/bash -eux


# Clean up
apt-get -y autoremove
apt-get -y clean

# Removing leftover leases and persistent rules
echo "Cleaning up dhcp leases"
rm -rf /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "Cleaning up udev rules"
rm -rf /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm -rf /lib/udev/rules.d/75-persistent-net-generator.rules

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces
