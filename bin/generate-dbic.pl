#!/usr/bin/env perl

use local::lib 'local';
use Modern::Perl;

use DBIx::Class::Schema::Loader qw/ make_schema_at /;
make_schema_at(
    'Model::Schema',
    { debug => 1,
      dump_directory => './lib',
    },
    [ 'dbi:Pg:dbname="perl-mojo";host=perl-mojo-postgresql;port=5432', 'perl-mojo', 'mypassword' ],
);