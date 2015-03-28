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
		'www.targobank.de'          \
        'portal.sparkasse-amberg-sulzbach.de'       \
        'banking.berliner-sparkasse.de'             \
        'banking.s-jena.de'                         \
        'banking.sparkasse-altenburgerland.de'      \
        'banking.sparkasse-saalfeld-rudolstadt.de'  \
        'banking.sparkasse-gera-greiz.de'           \
        'banking.ksk-saale-orla.de'                 \
        'banking.kreissparkasse-eichsfeld.de'       \
        'banking.spkson.de'                         \
        'banking.rhoen-rennsteig-sparkasse.de'      \
        'banking.sparkasse-hildburghausen.de'       \
        'banking.spk-arnstadt-ilmenau.de'           \
        'banking.sparkasse-mittelthueringen.de'     \
        'banking.kyffhaeusersparkasse.de'           \
        'banking.kreissparkasse-nordhausen.de'      \
        'banking.wartburg-sparkasse.de'             \
        'banking.kreissparkasse-gotha.de'           \
        'banking.sparkasse-unstrut-hainich.de'      \
        'banking.spk-luebeck.de'                    \
        'banking.sparkasse-wedel.de'                \
        'banking.sparkasse-holstein.de'             \
        'banking.ksk-ratzeburg.de'                  \
        'banking.foerde-sparkasse.de'               \
        'banking.bordesholmer-sparkasse.de'         \
        'banking.spk-hohenwestedt.de'               \
        'banking.spk-mittelholstein.de'             \
        'banking.nospa.de'                          \
        'banking.sparkasse-elmshorn.de'             \
        'banking.spk-westholstein.de'               \
        'banking.spk-hennstedt-wesselburen.de'      \
        'banking.saalesparkasse.de'                 \
        'banking.sparkasse-msh.de'                  \
        'banking.spk-burgenlandkreis.de'            \
        'banking.ksk-anhalt-bitterfeld.de'          \
        'banking.sparkasse-dessau.de'               \
        'banking.sparkasse-wittenberg.de'           \
        'banking.spaw.de'                           \
        'banking.sparkasse-magdeburg.de'            \
        'banking.kreissparkasse-boerde.de'          \
        'banking.sparkasse-jerichower-land.de'      \
        'banking.salzlandsparkasse.de'              \
        'banking.ksk-stendal.de'                    \
        'banking.ostsaechsische-sparkasse-dresden.de'   \
        'banking.sparkasse-meissen.de'              \
        'www.ksk-bautzen.de'                        \
        'banking.sparkasse-leipzig.de'              \
        'banking.spk-muldental.de'                  \
        'banking.sparkasse-doebeln.de'              \
        'banking.spk-zwickau.de'                    \
        'banking.sparkasse-vogtland.de'             \
        'www.sparkasse-chemnitz.de'                 \
        'banking.erzgebirgssparkasse.de'            \
        'bankingportal.sparkasse-ger-kandel.de'     \
        'bankingportal.sparkasse-suew.de'           \
        'bankingportal.sparkasse-donnersberg.de'    \
        'bankingportal.kskkl.de'                    \
        'bankingportal.sparkasse-rhein-haardt.de'   \
        'bankingportal.sparkasse-vorderpfalz.de'    \
        'bankingportal.sparkasse-suedwestpfalz.de'  \
        'bankingportal.ksk-kusel.de'                \
        'bankingportal.kskmayen.de'                 \
        'bankingportal.ksk-westerwald.de'           \
        'bankingportal.sparkasse-koblenz.de'        \
        'bankingportal.ksk-birkenfeld.de'           \
        'bankingportal.kskrhein-hunsrueck.de'       \
        'bankingportal.sparkasse-mainz.de'          \
        'bankingportal.kskbitburg-pruem.de'         \
        'bankingportal.ksk-vulkaneifel.de'          \
        'bankingportal.sparkasse-emh.de'            \
        'bankingportal.sparkasse-trier.de'          \
        'bankingportal.kreissparkasse-ahrweiler.de' \
        'bankingportal.stadtsparkasse-kaiserslautern.de'    \
        'bankingportal.kreissparkassealtenkirchen.de'       \
        'bankingportal.sparkasse-neuwied.de'        \
        'bankingportal.stadtsparkasse-rahden.de'    \
        'bankingportal.sparkasse-kleve.de'          \
        'banking.sparkasse-muensterland-ost.de'     \
        'bankingportal.sparkasse-finnentrop.de'     \
        'bankingportal.sskbo.de'                    \
        'bankingportal.sparkasse-paderborn-detmold.de'      \
        'bankingportal.sparkasse-blomberg.de'       \
        'bankingportal.sparkasse-hoexter.de'        \
        'bankingportal.sparkasse-bielefeld.de'      \
        'bankingportal.sparkasse-dortmund.de'       \
        'bankingportal.sparkasse-bochum.de'         \
        'bankingportal.sparkasse-bottrop.de'        \
        'bankingportal.stadtsparkasse-bocholt.de'   \
        'bankingportal.spk-dinslaken.de'            \
        'bankingportal.sparkasse-duisburg.de'       \
        'bankingportal.sparkasse-westmuensterland.de'       \
        'bankingportal.sparkasse-aachen.de'         \
        'bankingportal.sparkasse-dueren.de'         \
        'bankingportal.sparkasse-honnef.de'         \
        'bankingportal.sparkasse-burbach-neunkirchen.de'    \
        'bankingportal.sparkasse-wittgenstein.de'   \
        'bankingportal.sparkasse-alk.de'            \
        'bankingportal.spk-bergkamen-boenen.de'     \
        'bankingportal.sparkasse-beckum.de'         \
        'bankingportal.sparkasse-arnsberg-sundern.de'       \
        'bankingportal.sparkasse-hochsauerland.de'  \
        'banking.sparkasse-hildesheim.de'           \
        'banking.sparkasse-aurich-norden.de'        \
        'banking.sparkasse-emden.de'                \
        'banking.sparkasse-leerwittmund.de'         \
        'banking.ssk-cuxhaven.de'                   \
        'banking.sparkasse-celle.de'                \
        'banking.sparkasse-hannover.de'             \
        'banking.stadtsparkasse-burgdorf.de'        \
        'banking.sparkasse-nienburg.de'             \
        'banking.sparkasse-weserbergland.de'        \
        'banking.ssk-hameln.de'                     \
        'banking.ssk-bad-pyrmont.de'                \
        'banking.spk-muenden.de'                    \
        'banking.spk-goettingen.de'                 \
        'banking.sparkasse-duderstadt.de'           \
        'banking.ssk-bad-sachsa.de'                 \
        'banking.sparkasse-einbeck.de'              \
        'banking.blsk.de'                           \
        'banking.spk-gifhorn-wolfsburg.de'          \
        'banking.sparkasse-nordhorn.de'             \
        'banking.ksk-melle.de'                      \
        'banking.kreissparkasse-diepholz.de'        \
        'banking.ksk-bersenbrueck.de'               \
        'banking.sparkasse-emsland.de'              \
        'banking.mueritz-sparkasse.de'              \
        'banking.spk-mecklenburg-strelitz.de'       \
        'banking.sparkasse-uecker-randow.de'        \
        'banking.spk-vorpommern.de'                 \
        'banking.ospa.de'                           \
        'banking.sparkasse-mecklenburg-schwerin.de' \
        'banking.sparkasse-parchim.de'              \
        'banking.spk-mecklenburg-nordwest.de'       \
        'banking.mbs-potsdam.de'                    \
        'bankingportal.sparkasse-gruenberg.de'      \
        'bankingportal.stadtsparkasse-grebenstein.de'       \
        'bankingportal.sparkasse-wa-fkb.de'         \
        'bankingportal.sskborken.de'                \
        'bankingportal.ssk-felsberg.de'             \
        'bankingportal.sparkasse-battenberg.de'     \
        'bankingportal.spk-laubach-hungen.de'       \
        'bankingportal.sparkasse-giessen.de'        \
        'bankingportal.sparkasse-dillenburg.de'     \
        'bankingportal.sparkasse-fulda.de'          \
        'bankingportal.spk-hef.de'                  \
        'bankingportal.sparkasse-werra-meissner.de' \
        'bankingportal.frankfurter-sparkasse.de'    \
        'bankingportal.sparkasse-oberhessen.de'     \
        'bankingportal.taunussparkasse.de'          \
        'bankingportal.sparkasse-hanau.de'          \
        'bankingportal.ksk-gelnhausen.de'           \
        'bankingportal.sparkasse-darmstadt.de'      \
        'bankingportal.kskgrossgerau.de'            \
        'bankingportal.sparkasse-bensheim.de'       \
        'bankingportal.sparkasse-starkenburg.de'    \
        'bankingportal.sparkasse-odenwaldkreis.de'  \
        'bankingportal.sparkasse-dieburg.de'        \
        'bankingportal.ksk-limburg.de'              \
        'ssl2.haspa.de'                             \
        'banking.sparkasse-harburg-buxtehude.de'    \
        'banking.wespa.de'                          \
        'finanzcenter.sparkasse-bremen.de'          \
        'banking.sparkasse-spree-neisse.de'         \
        'banking.spk-elbe-elster.de'                \
        'banking.mbs-potsdam.de'                    \
        'banking.s-os.de'                           \
        'banking.sparkasse-mol.de'                  \
        'banking.spk-barnim.de'                     \
        'banking.sparkasse-schwedt.de'              \
        'banking.sparkasse-opr.de'                  \
        'banking.sparkasse-prignitz.de'             \
        'banking.spk-uckermark.de'                  \
        'bankingportal.sparkasse-heidelberg.de'     \
        'bankingportal.ksk-fds.de'                  \
        'bankingportal.sparkasse-pforzheim-calw.de' \
        'bankingportal.ksk-bc.de'                   \
        'bankingportal.sparkasse-pm.de'             \
        'bankingportal.sparkasse-rhein-neckar-nord.de'      \
        'bankingportal.kskbb.de'                    \
        'bankingportal.ksklb.de'                    \
        'bankingportal.sparkasse-zollernalb.de'     \
        'bankingportal.ksk-gp.de'                   \
        'bankingportal.ksk-es.de'                   \
        'bankingportal.sparkasse-heilbronn.de'      \
        'bankingportal.spk-hohenlohekreis.de'       \
        'bankingportal.sparkasse-neckartal-odenwald.de'     \
        'bankingportal.sparkasse-karlsruhe-ettlingen.de'    \
        'bankingportal.spk-bbg.de'                  \
        'bankingportal.sparkasse-kehl.de'           \
        'bankingportal.sparkasse-haslach-zell.de'   \
        'bankingportal.spk-gengenbach.de'           \
        'bankingportal.sparkasse-engo.de'           \
        'bankingportal.sparkasse-bodensee.de'       \
        'bankingportal.sparkasse-freiburg.de'       \
        'bankingportal.sparkasse-markgraeflerland.de'       \
        'bankingportal.sparkasse-loerrach.de'       \
        'bankingportal.ksk-heidenheim.de'           \
        'homebanking.sskm.de'                       \
        'portal.spk-ro-aib.de'                      \
        'portal.sparkasse-schongau.de'              \
        'portal.sparkasse-nuernberg.de'             \
        'portal.sparkasse-hochfranken.de'           \
        'portal.spk-aschaffenburg.de'               \
        'www.sparkasse-ffb.de'                      \
        'portal.sparkasse-bgl.de'                   \
        'portal.sparkasse-rottal-inn.de'            \
        'portal.sparkasse-dachau.de'                \
        'portal.sparkasse-freising.de'              \
        'portal.spked.de'                           \
        'portal.kreissparkasse-augsburg.de'         \
        'portal.sska.de'                            \
        'portal.spk-aic-sob.de'                     \
        'portal.sparkasse-donauwoerth.de'           \
        'portal.sparkasse-dillingen.de'             \
        'portal.sparkasse-fuerth.de'                \
        'banking.sparkasse-erlangen.de'             \
        'portal.sparkasse-forchheim.de'             \
        'portal.spk-frg.de'                         \
        'portal.sparkassedeggendorf.de'             \
        'portal.spk-kg.de'                          \
        'portal.sparkasse-ansbach.de'               \
        'portal.sparkasse-dinkelsbuehl.de'          \
        'banking.bw-bank.de'       \
        'banking.postbank.de');

LDNS_DANE=$(which ldns-dane 2> /dev/null)
HOST=$(which host 2> /dev/null)

TESTED=0
VALID=0

if [ ! $LDNS_DANE ];
then
	echo "ldns-dane is needed to run this script"
	echo "Get it from http://www.nlnetlabs.nl/projects/ldns/"
	exit -1
fi

if [ ! $HOST ];
then
    echo "No DNS lookup utility found"
    exit -1
fi

for bank in ${banks[@]}; do
    status=-1
    res=$($HOST $bank 2> /dev/null)
    status=$?
    if [ $status -ne 0 ];
    then
        continue;
    fi
    status=-1
    TESTED=$((TESTED + 1))
	res=$($LDNS_DANE verify $bank 443 2> /dev/null)
	status=$?
	if [ $status -eq 0 ];
    then
		echo -e $bank "\e[32mvalid\e[0m DANE/TLSA found"
        VALID=$((VALID + 1))
	else
		echo -e $bank "\e[31mno valid\e[0m DANE/TLSA found"
	fi
done
echo $VALID "out of" $TESTED "tested banking portals use DANE/TLSA"
