#!/bin/sh -e

##
#   This is a fork from https://gist.github.com/corny/7a07f5ac901844bd20c9
#   including some changes
##

hostname=$1
device=$2
file=$HOME/.dynv6.addr6

# check for used tools
BIN_CURL=$(which curl 2>/dev/null || echo "")
BIN_WGET=$(which wget 2>/dev/null || echo "")
BIN_RDISC6=$(which rdisc6 2>/dev/null || echo "" )

if [ -e $file ]; then
    old=$(cat $file)
fi

if [ -z "$hostname" -o -z "$token" ]; then
  echo "Usage: token=<your-authentication-token> [netmask=64] $0 your-name.dynv6.net [device]"
  exit 1
fi

if [ -z "$netmask" ]; then
    netmask=128
fi

if [ -n $BIN_RDISC6 ]; then
    if [ ! $device ]; then
        # setting $device to a default value
        # rdisc6 needs a device
        device="eth0"
    fi
    address=$($BIN_RDISC6 -1 -r1 -q $device)
else
    if [ -n "$device" ]; then
        device="dev $device"
    fi
    address=$(ip -6 addr list scope global $device | grep -v " fd" | sed -n 's/.*inet6 \([0-9a-f:]\+\).*/\1/p' | head -n 1)
fi

if [ -z "$address" ]; then
    echo "no IPv6 address found"
    exit 1
fi
# address with netmask
current=$address/$netmask

if [ ${#BIN_CURL} -ge 1 ]; then
  bin="$BIN_CURL -fsS"
elif [ ${#BIN_WGET} -ge 1 ]; then
  bin="$BIN_WGET -O-"
else
  echo "neither curl nor wget found"
  exit 1
fi

if [ "$old" = "$current" ]; then
  echo "IPv6 address unchanged"
  exit
fi

# send addresses to dynv6
$bin "http://dynv6.com/api/update?hostname=$hostname&ipv6=$current&token=$token"

# save current address
echo $current > $file
