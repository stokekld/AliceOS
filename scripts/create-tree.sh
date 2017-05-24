#/bin/bash

mkdir -pv $SOURCES
mkdir -pv $TRUETOOLS

su -c "ln -sv $TRUETOOLS $TOOLS"
#su -c "chown jesus:jesus"

chmod -v a+wt $SOURCES

mkdir -pv $BUILD


