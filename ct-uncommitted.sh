#!/bin/sh

function printUsage {
    echo $1 "-d /vobs/to/project [-u user] [-h]"
    echo ""
    echo "-d /vobs/to/project"
    echo "Specifies the path where to find uncommitted changes."
    echo "-u user"
    echo "Limit the output to a specified user."
    echo "-h"
    echo "Print this help"
    echo ""
}

CT=$(which cleartool 2> /dev/null)

if [ ! $CT ];
then
    echo "ClearCase is needed, to run this script."
    exit -1
fi

if [ $# -eq 0 ];
then
    printUsage $0
    exit -1
fi

while getopts "hd:u:" arg;
do
    case $arg in
        d)
            ctDir=$OPTARG
            ;;
        u)
            ctBy=$OPTARG
            ;;
        h)
            printUsage $0
            exit 0
            ;;
        *)
            echo "Unknown option"
            printUsage $0
            exit -1
            ;;
    esac
done

if [ ! -d $ctDir ];
then
    echo "Invalid path:" $ctDir
    exit -1
fi

if [ $ctBy ];
then
    limit2User=$(echo "-user" $ctBy)
fi

for change in $($CT lsco $limit2User -r -fmt "%Xn;%u;%Tf\n" $ctDir)
do
    ctFile=$(echo $change | cut -d ";" -f 1)
    ctUser=$(echo $change | cut -d ";" -f 2)
    ctView=$(echo $change | cut -d ";" -f 3)
    echo $(echo $ctFile | cut -d "@" -f 1) "by" $ctUser
    $CT setview -exec "$CT diff -predecessor -columns 162 $(echo $ctFile | cut -d "@" -f 1) " $ctView
    echo ""
done
