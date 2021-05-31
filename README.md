Dependencias MINGW - image

WIN32

find -name '*.pc' | while read pc; do sed -e "s@^prefix=.*@prefix=$PWD@" -i "$pc"; done


credits tarnyko.net
credits giuspen
