set -e

sudo apt-get -u update
sudo apt-get -y upgrade
sudp apt-get -y install git python3 python3-pip

wget https://bitcoin.org/bin/bitcoin-${version}/bitcoin-${version}-x86_64-linux-gn.tar.tz
tar -zxvf bitcoin-${version}-x86_64-linux-gn.tar.tz
./bitcoin-{version}/bin/bitcoind -daemon
