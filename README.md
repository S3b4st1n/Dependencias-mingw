# GTK3.0
GTK3.0 GTKMM3.0 MINGW 32 BITS


tar xvf GTK-3.tar.xz 
tar xvf GTKMM-3.tar.xz 

find -name '*.pc' | while read pc; do sed -e "s@^prefix=.*@prefix=$PWD@" -i "$pc"; done


credits tarnyko.net
credits giuspen
