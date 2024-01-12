curl -LO http://ftp.gnu.org/gnu/coreutils/coreutils-9.4.tar.xz
tar xvJf coreutils-9.4.tar.xz
rm coreutils-9.4.tar.xz
cd coreutils-9.4/
curl -LO https://raw.githubusercontent.com/chukfinley/advcpmv/master/advcpmv-0.9-9.4.patch
patch -p1 -i advcpmv-0.9-9.4.patch
export FORCE_UNSAFE_CONFIGURE=1
./configure
make
sudo /usr/bin/env cp ./src/cp /usr/bin/advcp
sudo /usr/bin/env cp ./src/mv /usr/bin/advmv
cd ..
rm -rf coreutils-9.4
echo done
