package Temperature::Windchill;

use strict;
use warnings;
use base 'Exporter';

our $VERSION = '0.01';
our @EXPORT_OK = qw( windchill_si windchill_us );

=head1 NAME

Temperature::Windchill - calculate effective temperature as 

=head1 SYNOPSIS

    use Temperature::Windchill 'windchill';

    # calculate windchill in American units (Fahrenheit, MPH)
    my $wc = windchill_us($temp, $windspeed);

    # calculate windchill in International units (Celsius, KPH)
    my $wc = windchill_si($temp, $windspeed);

=head1 DESCRIPTION

From the US National Oceanic and Atmospheric Administration ("NOAA") website:

=over 4

I<< The windchill temperature is how cold people and animals feel when outside.
Windchill is based on the rate of heat loss from exposed skin caused by wind
and cold. As the wind increases, it draws heat from the body, driving down skin
temperature and eventually the internal body temperature. Therefore, the wind
makes it B<feel> much colder. If the temperature is 0 degrees Fahrenheit and
the wind is blowing at 15 mph, the windchill is -19 degrees Fahrenheit. At this
windchill temperature, exposed skin can freeze in 30 minutes. >>

=back

=head2 Limitations

Windchill Temperature is only defined for:

=over 4

=item

temperatures above -50 �F (-45.5 �C) and below 50 �F (10 �C)

=item

wind speeds above 3 MPH (4.8 KPH) and below 110 MPH (177 KPH).

=back

Bright sunshine may increase the windchill temperature by 10 to 18 �F.

=head1 FUNCTIONS

=head2 windchill_us( $temperature, $windspeed )

Calculates the windchill in United States ("US") units, i.e. temperature in
degrees Fahrenheit and windspeed in miles per hour.

Example:

    # what's the windchill at 10 �F and 15 MPH?
    my $chill = windchill_us( 10, 15 );
    print "the windchill is: $chill �F";

=cut

sub windchill_us {
    my ($temp, $windspeed) = @_;
    my $pow = $windspeed ** 0.16;
    return 35.74 + (0.6215 * $temp) - (35.75 * $pow) + (0.4275 * $temp * $pow);
}

=head2 windchill_si( $temperature, $windspeed )

Calculates the windchill in International ("SI") units, i.e. temperature in
degrees Celsius and windspeed in kilometers per hour.

Example:

    # what's the windchill at -5 �C and 20 KPH?
    my $chill = windchill_si( -5, 20 );
    print "the windchill is: $chill �C";

=cut

sub windchill_si {
    my ($temp, $windspeed) = @_;
    my $pow = $windspeed ** 0.16;
    return 13.12 + (0.6215 * $temp) - (11.37 * $pow) + (0.3965 * $temp * $pow);
}

=head1 ADDITIONAL RESOURCES

=over 4

=item

L<http://www.ofcm.gov/jagti/r19-ti-plan/pdf/entire_r19_ti.pdf>

=item

L<http://www.weather.gov/os/windchill/index.shtml>

=item

L<http://www.weather.gov/om/windchill/windchillglossary.shtml>

=back

=head1 AUTHOR

John Trammell, C<< <johntrammell at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-temperature-windchill at
rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Temperature-Windchill>.  I
will be notified, and then you'll automatically be notified of progress on your
bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Temperature::Windchill

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Temperature-Windchill>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Temperature-Windchill>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Temperature-Windchill>

=item * Search CPAN

L<http://search.cpan.org/dist/Temperature-Windchill>

=back

=head1 ACKNOWLEDGEMENTS

I would like to thank all the attendees of the Frozen Perl 2008 conference, who
inspired me to write this module.

=head1 COPYRIGHT & LICENSE

Copyright 2008 John Trammell, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;

