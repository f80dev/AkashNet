#Installation pour FEDORA 33

cd /root/akash

export AKASH_NET="https://raw.githubusercontent.com/ovrclk/net/master/testnet"
export AKASH_VERSION="$(curl -s "$AKASH_NET/version.txt")"
export AKASH_CHAIN_ID="$(curl -s "$AKASH_NET/chain-id.txt")"

#dnf install unzip
#curl https://raw.githubusercontent.com/ovrclk/akash/master/godownloader.sh | sh -s -- "v$AKASH_VERSION"

dnf install go
dnf install make

export GOPATH="/root/akash"
go get -d github.com/ovrclk/akash
cd $GOPATH/src/github.com/ovrclk/akash
git checkout "$AKASH_VERSION"
make deps-install
make install

export AKASH_KEY_NAME="hhoareau"
export AKASH_KEYRING_BACKEND="os"

akash --keyring-backend "$AKASH_KEYRING_BACKEND" keys add "$AKASH_KEY_NAME"
