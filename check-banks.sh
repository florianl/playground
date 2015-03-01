#!/bin/sh

##
# Copyright (c) 2015, Florian Lehner <dev (at) der-flo.net>
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted, provided that the
# above copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
# PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
##

banks=('kunde.comdirect.de' 		\
		'www.1822direkt-banking.de'	\
		'banking.dkb.de'			\
		'meine.norisbank.de'		\
		'my.hypovereinsbank.de'		\
		'www.dab-bank.de'			\
		'banking.ing-diba.de'		\
		'banking.netbank.de'		\
		'kunden.commerzbank.de'		\
		'meine.deutsche-bank.de'	\
		'www.targobank.de');

LDNS_DANE=$(which ldns-dane 2> /dev/null)

if [ ! $LDNS_DANE ];
then
	echo "ldns-dane is needed to run this script"
	echo "Get it from http://www.nlnetlabs.nl/projects/ldns/"
	exit -1
fi

for bank in ${banks[@]}; do
	res=$($LDNS_DANE verify $bank 443 2> /dev/null)
	status=$?
	if [ $status -eq 0 ]; then
		echo $bank "uses DANE/TLSA"
	else
		echo $bank "no valid DANE/TLSA found"
	fi
done
