--\c perl-mojo

CREATE TABLE IF NOT EXISTS competition (
  name VARCHAR(64) PRIMARY KEY,
  prize_money DECIMAL(12,2) DEFAULT 0.00 NOT NULL
);

CREATE TABLE IF NOT EXISTS team (
  name VARCHAR(64) PRIMARY KEY,
  location VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS competition_team (
  competition VARCHAR(64) NOT NULL,
  team VARCHAR(64) NOT NULL,
  PRIMARY KEY (competition, team),
  FOREIGN KEY (competition) REFERENCES competition(name),
  FOREIGN KEY (team) REFERENCES team(name)
);

CREATE TABLE IF NOT EXISTS player (
  id serial PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  squad_number int,
  position VARCHAR(32),
  team VARCHAR(64) NOT NULL,
  FOREIGN KEY (team) REFERENCES team(name)
);



--insert into competition (name, prize_money) values ('premier league', 160000000);