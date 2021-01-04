sudo -E apt-get update && sudo -E apt-get upgrade -y && sudo -E apt-get autoremove -y
# make Downloads directory
mkdir ~/Downloads
# download install script
curl -fsSL https://get.docker.com -o ~/Downloads/get-docker.sh
# install docker
sudo -E sh ~/Downloads/get-docker.sh
# install docker-compose
sudo -E curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# change the permission
sudo chmod +x /usr/local/bin/docker-compose
