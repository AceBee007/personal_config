sudo -E apt-get update && sudo -E apt-get upgrade -y && sudo -E apt-get autoremove -y
# make Downloads directory
mkdir ~/Downloads
# download install script
curl -fsSL https://get.docker.com -o ~/Downloads/get-docker.sh
# install docker
sudo -E sh ~/Downloads/get-docker.sh
