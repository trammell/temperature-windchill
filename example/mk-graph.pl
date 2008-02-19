#!perl

use strict;
use warnings;
use Temperature::Windchill 'windchill_us';

my @wind = map { 5 * $_ } 1 .. 10;   # windspeeds
my @temp = map { 5 * $_ } -8 .. 8;   # temperatures

print <<"__html__";
<table>
<tr>
<td rowspan=20>Windspeed<br>in MPH</td>
<td style='text-align:center' colspan=20>Temperature in °F</td>
<tr><th>
__html__

foreach my $temp (@temp) {
    print "<th>$temp</th>";
}

# print data
foreach my $wind (@wind) {
    print "<tr>\n";
    print "<th>$wind</th>\n";
    foreach my $temp (@temp) {
        my $chill = sprintf '%.0f', windchill_us($temp, $wind);
        my $color = color($chill);
        print qq{<td style="background: $color; width: 2em" align=center>$chill</td>};
    }
    print "</tr>\n";
}

print "</table>\n";

# red is #ff0000, yellow is #ffff00
sub color {
    my $temp = shift;
    my $num = ($temp + 70) * 3;
    $num = 0   if $num < 0;
    $num = 255 if $num > 255;
    return sprintf '#ff%02x00', $num;
}

