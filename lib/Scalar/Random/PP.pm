package Scalar::Random::PP;
use Scalar::Random::OO;

has 'limit' => ( is => 'ro' );
Scalar::Random::OO::Exporter->setup_import_methods(
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
