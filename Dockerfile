FROM perl:5.36-slim
WORKDIR /usr/src/myapp
COPY . .

# Need gcc installed to build DBI etc
# Need postgresql and libpq-dev to build DBD::Pg
RUN apt update \
    && apt -y install build-essential postgresql libpq-dev

# Build dependencies
RUN cpanm local::lib \
    && cpanm -l local --installdeps .

# Run the app 
CMD [ "morbo", "./myapp.pl", "daemon", \
      "-m", "production", \
      "-l", "http://*:3000" \
    ]