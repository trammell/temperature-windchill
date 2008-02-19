use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Temperature::Windchill',
    license             => 'perl',
    dist_author         => 'John Trammell <johntrammell@gmail.com>',
    dist_version_from   => 'lib/Temperature/Windchill.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Temperature-Windchill-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
