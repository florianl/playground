#!/bin/sh

FEDPKG=$(which fedpkg 2> /dev/null)

function update {

    for i in $($FEDPKG switch-branch -l | grep -v Locals | grep -v Remotes | grep -v origin);
    do
        $FEDPKG switch-branch $i || continue
        $FEDPKG pull
    done
}

if [ ! $FEDPKG ];
then
    echo "fedpkg is needed to run this script"
    exit -1
fi

if [ "$#" == "0" ];
then
    echo "no arguments received"
    exit -1
fi

while (( "$#"));
do
    if [ -d $1 ];
    then
        pushd $1
        update
        popd
    fi
    shift
done
