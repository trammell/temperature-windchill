package Temperature::Windchill;

use strict;
use warnings;

our $VERSION = '0.01';

=head1 NAME

Temperature::Windchill - calculate effective temperature as 

=head1 SYNOPSIS

    use Temperature::Windchill 'windchill';
    # calculate windchill in American units
    my $wc = windchill( $temp, $wind );

=head1 DESCRIPTION




=head2 Other Resources


=head1 FUNCTIONS

=head2 windchill_us( $temp, $speed )

Calculates the windchill in United States ("US") units, i.e. temperature in
degrees Fahrenheit and windspeed in miles per hour.

Example:

    # what's the windchill when the temperature is 10 °F
    # and the windspeed is 15 MPH?
    my $chill = windchill_us( 10, 15 );
    print "the windchill is: $chill °F";

=cut

sub windchill_us {
    my ($temp, $wind) = @_;
    return $temp * $wind + 32;
}

=head2 windchill_si( $temp, $speed )

Calculates the windchill in International ("SI") units, i.e. temperature in
degrees Centigrade and windspeed in kilometers per hour.

Example:

    # what's the windchill when the temperature is -5 °C
    # and the windspeed is 20 KPH?
    my $chill = windchill_si( -5, 20 );
    print "the windchill is: $chill °C";

=cut

sub windchill_us {
    my ($temp, $wind) = @_;
    return $temp * $wind + 32;
}


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

