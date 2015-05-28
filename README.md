A python script for converting voltage to temperature units and vice versa.

* All voltage is measured in millivolts (mV)
* All temperature measurements are in degrees Celcius

Conversion formulae used are taken from [NIST thermocouple tables and coefficients](http://srdata.nist.gov/its90/main/)

No warranty given or implied whatsoever with this tool. Use at your own risk.

## Usage

Perform `tc.py -h` for full list of options.

### Examples

Convert 1.2mV type K to degrees C

    ./py.tc --mode v2k 1.2

Convert -0.1mV type J to temperature

    ./py.tc --mode v2j -0.1

Convert 0.1, 0.2, 0.3 mV type K to temperature

    ./py.tc --mode v2k 0.1 0.2 0.3

Covert tempratures 0, 50, 100 to type N millivolts

    ./py.tc --mode n2v 0 50 100

If you use the `--offset N` option, you can add an offset to the result.

Convert 0.1 mV type K to temperature, and add 25 degrees to result.

    ./py.tc --offset 25 --mode v2k 0.1

If no mode is given, `v2k` is assumed. The above is the same as:

    ./py.tc --offset 25 0.1

If there is an error converting a number, the result will be of the format `ERR:n` where `n` is the input number.

