use Test::Simple tests => 4;
use Test::Pockito;

use strict;
use warnings;

{
    my @params_called   = ( 1, 2, 3 );
    my @params_expected = ( 1, 2, 3 );

    my ( $found, @results ) = Test::Pockito::default_call_match(
        "some package",  "some method",
        \@params_called, \@params_expected
    );

    ok( $found == 1, "Comparing same size things is fine" );
}

{
    my @params_called   = (1);
    my @params_expected = ( 1, undef, undef );
    my @call_result     = ( 4, 5, 6 );

    my ( $found, $results ) = Test::Pockito::default_call_match(
        "some package",  "some method",
        \@params_called, \@params_expected
    );
    ok( $found == 1, "Comparing different size things w/ undefs in one match" );
}

{
    my @params_called   = (1);
    my @params_expected = ();

    my ( $found, $results ) = Test::Pockito::default_call_match(
        "some package",  "some method",
        \@params_called, \@params_expected
    );
    ok( $found == 0,
        "Comparing different size things w/ right side has nothing" );
}

{
    my @params_called   = ();
    my @params_expected = (1);

    my ( $found, $results ) = Test::Pockito::default_call_match(
        "some package",  "some method",
        \@params_called, \@params_expected
    );
    ok( $found == 0,
        "Comparing different size things w/ left side has nothing" );
}

