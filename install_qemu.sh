# Tested on Ubuntu MATE 24.04
sudo apt update
sudo apt install -y qemu-system
sudo apt autoremove -y remmina*
sudo snap remove remmina
# We need to install the real remmina package (NOT a snap) to be able to see connected USB devices so we can USB passthrough later
sudo apt install -y remmina remmina-plugin-spice
