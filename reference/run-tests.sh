#!/bin/bash
#
# Test various functions of tc.py
#
# NEED TO BE CHECKED!
#

TMPFILE=".test_result"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function compare {
	# echo $(cat $TMPFILE)
	if [ "$2" != "$3" ]; then
		echo -e "${RED}FAIL${NC} $1"
	else
		echo -e "${GREEN}PASS${NC} $1"
	fi
}

python ../tc.py --mode b2mv 0 200 400 600 800 1000 1200 1400 1600 1800 | xargs > $TMPFILE
compare "Type B to mV" "$(cat $TMPFILE)" "0.000 0.178 0.787 1.792 3.154 4.834 6.786 8.956 11.263 13.591"

python ../tc.py --mode e2mv -200 0 200 400 600 800 1000 | xargs > $TMPFILE
compare "Type E to mV" "$(cat $TMPFILE)" "-8.825 0.000 13.421 28.946 45.093 61.017 76.373"

python ../tc.py --mode j2mv -200 0 200 400 600 800 1000 1200 | xargs > $TMPFILE
compare "Type J to mV" "$(cat $TMPFILE)" "-7.890 0.000 10.779 21.848 33.102 45.494 57.953 69.553"

python ../tc.py --mode k2mv -200 0 200 400 600 800 1000 1200 | xargs > $TMPFILE
compare "Type K to mV" "$(cat $TMPFILE)" "-5.891 0.000 8.138 16.397 24.905 33.275 41.276 48.838"

python ../tc.py --mode n2mv -200 0 200 400 600 800 1000 1200 | xargs > $TMPFILE
compare "Type N to mV" "$(cat $TMPFILE)" "-3.990 0.000 5.913 12.974 20.613 28.455 36.256 43.846"

python ../tc.py --mode r2mv -50 0 200 400 600 800 1000 1200 1400 1600 | xargs > $TMPFILE
compare "Type R to mV" "$(cat $TMPFILE)" "-0.226 0.000 1.469 3.408 5.583 7.950 10.506 13.228 16.040 18.849"

python ../tc.py --mode s2mv -50 0 200 400 600 800 1000 1200 1400 1600 | xargs > $TMPFILE
compare "Type S to mV" "$(cat $TMPFILE)" "-0.236 0.000 1.441 3.259 5.239 7.345 9.587 11.951 14.373 16.777"

python ../tc.py --mode t2mv -200 0 200 400 | xargs > $TMPFILE
compare "Type T to mV" "$(cat $TMPFILE)" "-5.603 0.000 9.288 20.872"

python ../tc.py --mode mv2b 0.291 0.787 1.792 3.154 4.834 6.786 8.956 11.263 13.591 | xargs > $TMPFILE
compare "mV to Type B" "$(cat $TMPFILE)" "249.9 400.1 600.0 800.0 1000.0 1200.0 1400.0 1600.0 1800.0"

python ../tc.py --mode mv2e -8.825 0.000 13.421 28.946 45.093 61.017 76.373 | xargs > $TMPFILE
compare "mV to Type E" "$(cat $TMPFILE)" "-200.0 0.0 200.0 400.0 600.0 800.0 1000.0"

python ../tc.py --mode mv2j -7.890 0.000 10.779 21.848 33.102 45.494 57.953 69.553 | xargs > $TMPFILE
compare "mV to Type J" "$(cat $TMPFILE)" "-200.0 0.0 200.0 400.0 600.0 800.0 1000.0 1200.0"

python ../tc.py --mode mv2k -5.891 0.000 8.138 16.397 24.905 33.275 41.276 48.838 | xargs > $TMPFILE
compare "mV to Type K" "$(cat $TMPFILE)" "-199.9 0.0 200.0 400.0 600.0 800.0 1000.0 1200.0"

python ../tc.py --mode mv2n -3.990 0.000 5.913 12.974 20.613 28.455 36.256 43.846 | xargs > $TMPFILE
compare "mV to Type N" "$(cat $TMPFILE)" "-199.9 0.0 200.0 400.0 600.0 800.0 1000.0 1200.0"

python ../tc.py --mode mv2r -0.226 0.000 1.469 3.408 5.583 7.950 10.506 13.228 16.040 18.849 | xargs > $TMPFILE
compare "mv to Type R" "$(cat $TMPFILE)" "-49.9 0.0 200.1 400.0 600.0 800.0 1000.0 1200.0 1400.0 1600.0"

python ../tc.py --mode mv2s -0.235 0.000 1.441 3.259 5.239 7.345 9.587 11.951 14.373 16.777 | xargs > $TMPFILE
compare "mv to Type S" "$(cat $TMPFILE)" "-49.8 0.0 200.0 400.0 600.0 800.0 1000.0 1200.0 1400.0 1600.0"

python ../tc.py --mode mv2t -5.603 0.000 9.288 20.872 | xargs > $TMPFILE
compare "mV to Type T" "$(cat $TMPFILE)" "-200.0 0.0 200.0 400.0"

rm -f $TMPFILE

exit 0

