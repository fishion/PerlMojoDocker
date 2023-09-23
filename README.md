# Local env setup

## Install Perlbrew & perl
```
curl -L https://install.perlbrew.pl | bash
perlbrew install perl-5.36.1
# I had issues with t/porting/libperl.t and needed
# to use --notest flag in the end.
perlbrew switch perl-5.36.1
```

## Install cpanm and application dependencies
```
perlbrew install-cpanm
cpanm local::lib # needs to install globally

cpanm -l local --installdeps .
```

## Run app
```./myapp.pl daemon -m production -l http://*:8080```