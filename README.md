# Running Perl Mojo app in Docker

## Building container

```bash
docker build -t perl-mojo .
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
# needs to install globally
cpanm local::lib 
# install project libs in local dir
cpanm -l local --installdeps .
```

### Run app

```bash
# create a docker network for application
docker network create perl-mojo

# start up database 
docker run --name perl-mojo-postgresql \
    --network perl-mojo \
    -p 5432:5432 \
    -e POSTGRES_USER=perl-mojo \
    -e POSTGRES_PASSWORD=mypassword \
    -v ${PWD}/.pg-data:/var/lib/postgresql/data \
    -v ${PWD}/bin/init-sql:/docker-entrypoint-initdb.d \
    -d \
    postgres:16.0

# start up app
docker run --name perl-mojo-app \
    --network perl-mojo \
    -dp 8080:3000 \
    -v ${PWD}:/usr/src/myapp \
    perl-mojo

./myapp.pl daemon -m production -l http://*:8080
```
