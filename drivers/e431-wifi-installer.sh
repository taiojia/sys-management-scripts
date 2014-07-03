sudo apt-get update
sudo apt-get -y install linux-headers$(uname -r | grep -Po "\-[a-z].*")
sudo apt-get -y install build-essential dkms
sudo apt-get -y install dpkg
sudo apt-get -y install bcmwl-kernel-source
