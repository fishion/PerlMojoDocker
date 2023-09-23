FROM perl:5.36-slim
WORKDIR /usr/src/myapp
COPY . .

RUN cpanm local::lib \
    && cpanm -l local --installdeps .

CMD [ "perl", "./myapp.pl", "daemon", \
      "-m", "production", \
      "-l", "http://*:3000" \
    ]