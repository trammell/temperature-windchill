#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok('Temperature::Windchill');
}

diag( "Testing Temperature::Windchill $Temperature::Windchill::VERSION, Perl $], $^X" );

