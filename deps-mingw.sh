#!/bin/sh

CFGPARMS_SSL="mingw --prefix=/openssl"
CFGPARMS_XERCES="--prefix=/xerces --host=mingw32"
CFGPARMS_JANSON="--prefix=/jannson --host=mingw32"

tar -xvf GTK3.0/openssl-1.0.0e.tar.gz 
cp -rf openssl-1.0.0e /openssl
cd /openssl 
./Configure ${CFGPARMS_SSL} 
make -j4  
cp /openssl/libssl.pc /usr/src/mxe/usr/i686-w64-mingw32.shared/lib/pkgconfig/
cp /openssl/libcrypto.pc /usr/src/mxe/usr/i686-w64-mingw32.shared/lib/pkgconfig/
cp /openssl/openssl.pc /usr/src/mxe/usr/i686-w64-mingw32.shared/lib/pkgconfig/
cd -
tar -xvf GTK3.0/jansson-2.7.tar.gz      
cd jansson-2.7       
./configure ${CFGPARMS_JANSON}  
make -j4                                            
make -j4 install 
cp jansson.pc /usr/src/mxe/usr/i686-w64-mingw32.shared/lib/pkgconfig/
cd ..
tar -xvf GTK3.0/xerces-c-3.1.1.tar.gz 
cd xerces-c-3.1.1          
./configure ${CFGPARMS_XERCES} 
make -j4                                           
make -j4 install 
cp xerces-c.pc /usr/src/mxe/usr/i686-w64-mingw32.shared/lib/pkgconfig/
cd ..
cp GTK3.0/qt.mk //usr/src/mxe/src/qt.mk
cd //usr/src/mxe/
make qt
cd -
exit 0
