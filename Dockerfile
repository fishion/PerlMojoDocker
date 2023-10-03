FROM perl:5.36-slim
WORKDIR /usr/src/myapp
COPY ./app .

# Need gcc installed to build DBI etc
# Need postgresql and libpq-dev to build DBD::Pg
RUN apt update \
    && apt -y install build-essential postgresql libpq-dev

# Build dependencies
# RUN cpanm --installdeps -n . # Running with no tests would be faster...
RUN cpanm --installdeps .

# Run the app : https://docs.mojolicious.org/Mojolicious/Command/prefork
CMD [ "./myapp.pl", "prefork" \
      , "-w", "4" \
      , "-m", "production" \
      , "-l", "http://*:8080" \
    ]