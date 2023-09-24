#!/usr/bin/env perl

use Modern::Perl;
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

make_schema_at(
    'MyApp::Schema',
    { debug => 1,
      dump_directory => './lib',
    },
    [ 'dbi:Pg:dbname="perl-mojo";host=perlmojodocker_postgresql_1;port=5432', 'perl-mojo', 'mypassword' ],
);