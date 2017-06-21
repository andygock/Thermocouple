A python script for converting thermocouple voltage to temperature units and vice versa.

* Supports thermocouples of types B, E, J, K, N, R, S, T
* All voltage is measured in millivolts (mV)
* All temperature measurements are in degrees Celcius

Conversion formulae used are taken from [NIST thermocouple tables and coefficients](http://srdata.nist.gov/its90/main/). You can view this data in the file `reference/allcoeff.tab`

No warranty given or implied whatsoever with this tool. Use at your own risk.

## Usage

Perform `tc.py -h` for full list of options.

### Examples

Convert 1.2mV type K to temperature

    ./py.tc --mode mv2k 1.2

Convert -0.1mV type J to temperature

    ./py.tc --mode mv2j -0.1

Convert 0.1, 0.2, 0.3 mV type K to temperature

    ./py.tc --mode mv2k 0.1 0.2 0.3

Convert 100 degrees C to Type K voltage

    ./py.tc --mode k2mv 100

#### Meter modes

Convert 0.1, 0.2, 0.3 mV type K to temperature, and show uncertainty when measurements are made from a Agilent
U1272A DMM

    ./py.tc --meter u1272a --mode mv2k 0.1 0.2 0.3

Convert temperatures 0, 50, 100 to type N millivolts

    ./py.tc --mode n2mv 0 50 100

#### Offsets

If you use the `--offset-output N` option, you can add an offset-output to the result. Use the `--offset-input N` option to add an offset to the input. Both of these options can be used together.

Convert 0.1 mV type K to temperature, and add 25 degrees to result.

    ./py.tc --offset-output 25 --mode mv2k 0.1

If no mode is given, `mv2k` is assumed. The above is the same as:

    ./py.tc --offset-output 25 0.1


