#!/bin/sh
set -e

#--------------------------------------------------------------------------------------------------
# Settings
#--------------------------------------------------------------------------------------------------

source="https://github.com/omega-gg"

#--------------------------------------------------------------------------------------------------
# environment

compiler_win="mingw"

qt="qt5"

#--------------------------------------------------------------------------------------------------
# Syntax
#--------------------------------------------------------------------------------------------------

if [ $# != 1 -a $# != 2 ] \
   || \
   [ $1 != "win32" -a $1 != "win64" -a $1 != "macOS" -a $1 != "linux" -a $1 != "android" ] \
   || \
   [ $# = 2 -a "$2" != "all" ]; then

    echo "Usage: 3rdparty <win32 | win64 | macOS | linux | android> [all]"

    exit 1
fi

#--------------------------------------------------------------------------------------------------
# Clone
#--------------------------------------------------------------------------------------------------

cd ..

if [ ! -d "Sky" ]; then

    git clone $source/Sky
fi

if [ ! -d "backend" ]; then

    git clone $source/backend
fi

#--------------------------------------------------------------------------------------------------
# 3rdparty
#--------------------------------------------------------------------------------------------------

cd Sky

if [ "$2" = "all" ]; then

    sh environment.sh $compiler_win
    sh environment.sh $qt

    sh 3rdparty.sh $1 all
else
    sh 3rdparty.sh $1
fi