FROM perl:5.36-slim
WORKDIR /usr/src/myapp

# Need gcc in build-essential for DBI etc
# Need postgresql and libpq-dev to build DBD::Pg
RUN apt update \
    && apt -y install build-essential postgresql libpq-dev

COPY ./app/cpanfile .
# Build dependencies
# RUN cpanm --installdeps -n . # Running with no tests would be faster...
RUN cpanm --installdeps .

# App files most likely to change, so copy as last layer.
COPY ./app .

# Run the app as preforking production server : https://docs.mojolicious.org/Mojolicious/Command/prefork
CMD [ "./myapp.pl", "prefork" \
      , "-w", "4" \
      , "-m", "production" \
      , "-l", "http://*:8080" \
    ]