#!perl -T

use Test::More tests => 3;

use_ok('Temperature::Windchill');
ok( exists &Temperature::Windchill::windchill_us );
ok( exists &Temperature::Windchill::windchill_si );

diag( "Testing Temperature::Windchill $Temperature::Windchill::VERSION, Perl $], $^X" );

