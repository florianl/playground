#!/bin/sh

FEDPKG=$(which fedpkg 2> /dev/null)

terminators=("Locals" "Remotes" "origin" "patch" "rpm" "spec" "sources")

function checkTerminators {
    for j in "${terminators[@]}";
    do
        if [[ $1 == *$j* ]];
        then
            # This is not a branch or you don't want to fetch it
            return 1
        fi
    done
    return 0
}

function update {

    for i in $($FEDPKG switch-branch -l);
    do
        checkTerminators $i
        if [ $? == 1 ];
        then
            continue
        fi
        $FEDPKG switch-branch $i 2> /dev/null || continue
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
