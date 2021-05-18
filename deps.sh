#!/bin/sh

PREFIX="01"
PKGNAME="libsigc++"
PKGVERS="2.2.11"
CFGPARMS="--enable-static --enable-shared --prefix=/gtkmm3 --host=mingw32"

rm -rf ${PKGNAME}-${PKGVERS}
tar -xf ${PKGNAME}-${PKGVERS}.tar.xz
cd ${PKGNAME}-${PKGVERS}

export PKG_CONFIG_PATH="/gtk3/lib/pkgconfig:/gtkmm3/lib/pkgconfig"
export LDFLAGS="-L/gtk3/lib -L/gtkmm3/lib -L/gtk3/bin -L/gtkmm3/bin"
export CFLAGS="-I/gtk3/include -I/gtkmm3/include"
export CXXFLAGS="-I/gtk3/include -I/gtkmm3/include"
export CPPFLAGS="-I/gtk3/include -I/gtkmm3/include"

./configure -h 2>&1 
./configure ${CFGPARMS} 2>&1 
#make clean
make -j4 2>&1 | tee ../logs/${PREFIX}_${PKGNAME}-make.log
make -j4 install 2>&1 | tee ../logs/${PREFIX}_${PKGNAME}-install.log
