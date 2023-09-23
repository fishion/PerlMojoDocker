#!/usr/bin/env perl

use v5.36;
use strict;
use warnings;
use local::lib 'local';

use Mojolicious::Lite -signatures;

# Route leading to an action that renders some text
get '/foo' => sub ($c) {
  my $response = {
    status => 'ok',
    text => 'hello world'
  };
  $c->render(json => $response);
};

app->start;