#/bin/bash
if [ -z "$1" ]
then
    echo "I need a list of downloads"
    exit -1
fi

wget --input-file=$1 --continue --directory-prefix=$SOURCES
