#!/bin/sh

CFGPARMS_SSL="mingw --prefix=/openssl"
CFGPARMS_XERCES="--prefix=/xerces --host=mingw32"
CFGPARMS_JANSON="--prefix=/jannson --host=mingw32"

tar -xvf GTK3.0/openssl-1.0.0e.tar.gz 
cd openssl-1.0.0e 
./configure ${CFGPARMS_SSL} 2>&1 
make -j4 2>&1 
cd ..
tar -xvf GTK3.0/jansson-2.7.tar.gz      
cd jansson-2.7       
./configure ${CFGPARMS_JANSON} 2>&1 
make -j4 2>&1                                            
make -j4 install 2>&1
cd ..
tar -xvf GTK3.0/xerces-c-3.1.1.tar.gz 
cd xerces-c-3.1.1          
./configure ${CFGPARMS_XERCES} 2>&1
make -j4 2>&1                                            
make -j4 install 2>&1
cd ..
cp /jansson/jansson.pc /usr/src/mxe/usr/i686-w64-mingw32.shared/lib/pkgconfig/
cp /xerces/xerces-c.pc /usr/src/mxe/usr/i686-w64-mingw32.shared/lib/pkgconfig/

exit 0
