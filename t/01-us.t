#!perl -T

use Test::More tests => 19;

use_ok('Temperature::Windchill', 'windchill_us');

# check a range of valid values
{
    my @valid = (
        # temperature, windspeed, windchill
        [  40, 15,  31.8 ],
        [  30, 15,  19.0 ],
        [  20, 15,   6.2 ],
        [  10, 15,  -6.6 ],
        [   0, 15, -19.4 ],
        [ -10, 15, -32.2 ],
        [ -20, 15, -45.0 ],
        [ -30, 15, -57.8 ],
        [ -40, 15, -70.6 ],

        [ 5,  5,  -4.6 ],
        [ 5, 10, -9.7 ],
        [ 5, 15, -13 ],
        [ 5, 20, -15.4 ],
        [ 5, 25, -17.4 ],
        [ 5, 30, -19.1 ],
        [ 5, 35, -20.5 ],
        [ 5, 40, -21.8 ],
        [ 5, 45, -23 ],
    );
    for (@valid) {
        my ($temp, $speed, $chill) = @$_;
        is(round(windchill_us($temp, $speed)), $chill);
    }
}
#is(windchill_us(1,2), 3);
#is(windchill_us(1,2), 3);
#is(windchill_us(1,2), 3);

sub round {
    return 0 + sprintf('%.1f' , $_[0]);
}


