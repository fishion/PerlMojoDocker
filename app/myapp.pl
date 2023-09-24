#!/usr/bin/env perl

use Modern::Perl;
use Mojolicious::Lite -signatures;

# Route leading to an action that renders some text
get '/foo' => sub ($c) {
  my $response = {
    status => 'ok',
    text => 'hello world!'
  };
  $c->render(json => $response);
};

app->start;