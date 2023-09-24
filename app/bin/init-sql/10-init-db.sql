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

-- Insert some data

insert into competition (name, prize_money)
  values
  ('premier league', 160000000);
insert into team (name, location)
  values
  ('West Ham United', 'London'),
  ('Brighton and Hove Albion', 'Brighton and Hove');
insert into competition_team (competition, team)
  values
  ('premier league', 'West Ham United'),
  ('premier league', 'Brighton and Hove Albion');
insert into player (name, squad_number, position, team)
  values
  ('Łukasz Fabiański', 1, 'Goalkeeper', 'West Ham United'),
  ('Alphonse Areola', 2, 'Goalkeeper', 'West Ham United'),
  ('Lucas Paquetá', 10, 'Midfielder', 'West Ham United'),
  ('Bart Verbruggen', 1, 'Goalkeeper', 'Brighton and Hove Albion'),
  ('Billy Gilmour', 11, 'Midfielder', 'Brighton and Hove Albion');
