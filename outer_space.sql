-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years, galaxy, moons)
VALUES
  ('Earth', 1.00, 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'Milky Way', '{}'),
  ('Neptune', 164.8, 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Milky Way', '{}');

  CREATE TABLE orbits(
    id SERIAL PRIMARY KEY,
    planet_id INTEGER NOT NULL REFERENCES planets ON DELETE CASCADE,
    orbits_around TEXT NOT NULL
  );

  INSERT INTO orbits (planet_id,orbits_around)
  VALUES
  (1,'The Sun'),
  (2,'The Sun'),
  (3,'The Sun'),
  (4,'The Sun'),
  (5,'Proxima Centauri'),
  (6,'Gliese 876')
;
