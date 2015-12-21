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
        'www.apobank.de'                            \
        'banking.sparda.de'                         \
        'onlinebanking.berliner-volksbank.de'       \
        'netbanking.sozialbank.de'                  \
        'finanzportal.fiducia.de'                   \
        'www.dovoba.de'                             \
        'www.kd-bank.de'                            \
        'www.hannoversche-volksbank.de'             \
        'www.bibessen.de'                           \
        'www.dkm.de'                                \
        'www.volksbank-phd.de'                      \
        'www.bkc-paderborn.de'                      \
        'banking.bank1saar.de'                      \
        'onlinebanking.psd-bank.de'                 \
        'www.gls-online-filiale.de'                 \
        'www.pax-bank.de'                           \
        'www.koelnerbank.de'                        \
        'www.grafschafter-volksbank.de'             \
        'www.edekabank.de'                          \
        'www.ostfriesische-volksbank.de'            \
        'www.maerkische-bank.de'                    \
        'www.genobank.de'                           \
        'www.voba-mg.de'                            \
        'www.volksbank-stade-cuxhaven.de'           \
        'www.aachener-bank.de'                      \
        'www.gladbacher-bank.de'                    \
        'www.pommerschevb.de'                       \
        'www.credvoba.de'                           \
        'www.bensbergerbank.de'                     \
        'www.spreewaldbank.de'                      \
        'www.nobaeg.de'                             \
        'www.harzer-volksbank.de'                   \
        'www.sylter-bank.de'                        \
        'www.mendener-bank.de'                      \
        'www.hs-banking.de'                         \
        'www.vrbfw.de'                              \
        'www.vbloeningen.de'                        \
        'www.huemmlinger-volksbank.de'              \
        'www.vb-gescher.de'                         \
        'www.vbemstek.de'                           \
        'www.vierlaender-volksbank.de'              \
        'www.kaltenkirchener-bank.de'               \
        'www.bruehlerbank.de'                       \
        'www.vb-nordhuemmling.de'                   \
        'www.foehr-amrumer-bank.de'                 \
        'www.skbwitten.de'                          \
        'www.mkbag.de'                              \
        'www.spadaka-hoengen.de'                    \
        'www.teba-kreditbank.net'                   \
        'banking.bw-bank.de'       \
        'my.number26.de'                            \
        'banking.fidor.de'                          \
        'consorsbank.de'                            \
        'banking.postbank.de');

LDNS_DANE=$(which ldns-dane 2> /dev/null)
HOST=$(which host 2> /dev/null)

TESTED=0
VALID=0
HTML=0

output(){
    if [ $HTML -eq 1 ];
    then
        echo "<tr>"
        TITLE=$(echo $2 | cut -d "." -f 2,3)
        echo "<td><a href=\"https://"$2"\">"$TITLE"</a></td>"
        if [ $1 -eq 0 ];
        then
            echo "<td>JA</td>"
            VALID=$((VALID + 1))
        else
            echo "<td>NEIN</td>"
        fi
        echo "</tr>"
    else
        if [ $1 -eq 0 ];
        then
            echo -e $2 "\e[32mvalid\e[0m DANE/TLSA found"
            VALID=$((VALID + 1))
        else
            echo -e $2 "\e[31mno valid\e[0m DANE/TLSA found"
        fi
    fi
}

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

while [[ "$1" == -* ]];
do
    case $1 in
        -h)
            HTML=1
            ;;
        *)
            echo $1 "unrecognized pattern"
            exit -1
            ;;
    esac
    shift
done

if [ $HTML -eq 1 ];
then
    echo "<!DOCTYPE html>"
    echo "<html lang="de">"
    echo "<head>"
    echo "<title>Nutzt deine Bank DANE/TLSA?</title>"
    echo "</head>"
    echo "<body>"
    echo "<table>"
    echo "Letzte Aktualisierung: " $(date +"%d.%m.%Y %H:%M Uhr")
    echo "<tr>"
    echo "<td>Bank</td>"
    echo "<td>DANE/TLSA</td>"
    echo "</tr>"
fi

for bank in ${banks[@]};
do
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
    output $status $bank
done

if [ $HTML -eq 1 ];
then
    echo "</table>"
    echo "Deine Bank ist nicht gelistet?"
    echo "<a href=\"https://github.com/florianl/playground/issues/new\">Dann lass deine Bank in diese Liste mit aufnehmen</a>"
    echo "</body>"
    echo "</html>"
else
    echo $VALID "out of" $TESTED "tested banking portals use DANE/TLSA"
fi
