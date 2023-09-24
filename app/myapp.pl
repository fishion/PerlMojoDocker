#!/usr/bin/env perl

use Modern::Perl;
use lib 'lib';

use Mojolicious::Lite -signatures;
use MyApp::Schema;
my $schema = MyApp::Schema->connect( 'dbi:Pg:dbname="perl-mojo";host=perlmojodocker_postgresql_1;port=5432', 'perl-mojo', 'mypassword' );

# Route leading to an action that renders some text
get '/competitions' => sub ($c) {

  my @comps = $schema->resultset('Competition')->all();

  $c->render(json =>  {
    status => 'ok',
    competitions => [map {name => $_->name(), prize_money => $_->prize_money()}, @comps]
  });
};

app->start;