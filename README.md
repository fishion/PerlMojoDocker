# Running Perl Mojo app in Docker

## Building and running container

```bash
docker build -t perl-mojo .
docker run -dp 8080:3000 perl-mojo
```

## Local env setup

### Install Perlbrew & perl

```bash
curl -L https://install.perlbrew.pl | bash
perlbrew install perl-5.36.1
# I had issues with t/porting/libperl.t and needed
# to use --notest flag in the end.
perlbrew switch perl-5.36.1
```

### Install cpanm and application dependencies

```bash
perlbrew install-cpanm
cpanm local::lib # needs to install globally

cpanm -l local --installdeps .
```

### Run app

```./myapp.pl daemon -m production -l http://*:8080```
