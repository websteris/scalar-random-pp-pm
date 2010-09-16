package Scalar::Random::PP;
use Scalar::Random::PP::OO;
use 5.008003;

our $VERSION = '0.10';

has 'limit' => ( is => 'ro' );
Scalar::Random::PP::OO::Exporter->setup_import_methods(
    as_is     => [ \&randomize ],
);

use overload '""' => sub {
    my $self = shift;
    my $limit = $self->limit;
    my $number = int(rand($limit + 1));
    return $number;
}, fallback => 1;

sub randomize {
    $_[0] = Scalar::Random::PP->new(@_ > 1 ? (limit => $_[1]) : ());    
}

1;


=encoding utf8

=head1 NAME

Scalar::Random::PP - Scalar::Random in Pure Perl

=head1 SYNOPSIS

    use Scalar::Random 'randomize';

    my $random;
    my $MAX_RANDOM = 100;

    randomize( $random, $MAX_RANDOM );

    print $random, "\n"; # '42'
    print $random, "\n"; # '17'
    print $random, "\n"; # '88'
    print $random, "\n"; # '4'
    print $random, "\n"; # '50'
    use inc::Module::Install;

=head1 DESCRIPTION

This module is intended to be a pure Perl replacement for L<Scalar::Random>.

Please see L<Scalar::Random> for full details.

=head1 NOTE

This module was written as a pair programming excerise between Ingy döt
Net and Webster Montego.

The module passes all the same tests as L<Scalar::Random>, even though
we felt there could be more elaborate testing. Perhaps we'll add the tests we'd like to see, so that Alfie John can backport them. :)

We also thought it would be nice if randomize took a lower limit, but we decided not to change the API unless Alfie did so first, so that the PP module would be an exact replacement.

=head1 AUTHOR

Webster Montego <websteris@cpan.org>
Ingy döt Net <ingy@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2010. Webster Montego and Ingy döt Net

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
