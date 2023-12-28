#!/bin/sh

set -e

ADVCPMV_VERSION=${1:-0.9}
CORE_UTILS_VERSION=${2:-9.3}

curl -LO http://ftp.gnu.org/gnu/coreutils/coreutils-$CORE_UTILS_VERSION.tar.xz
tar xvJf coreutils-$CORE_UTILS_VERSION.tar.xz
rm coreutils-$CORE_UTILS_VERSION.tar.xz
(
    cd coreutils-$CORE_UTILS_VERSION/
    curl -LO https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-$ADVCPMV_VERSION-$CORE_UTILS_VERSION.patch
    patch -p1 -i advcpmv-$ADVCPMV_VERSION-$CORE_UTILS_VERSION.patch
    ./configure
    make
    sudo /usr/bin/env cp ./src/cp /usr/bin/advcp
    sudo /usr/bin/env cp ./src/mv /usr/bin/advmv
)
cd ..

rm -rf advcpmv
echo done
