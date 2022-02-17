-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album TEXT NOT NULL,
  producers TEXT[] NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds,album, producers)
VALUES
  ('MMMBop', 238, 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, 'Daydream', '{"Walter Afanasieff"}'),
  ('Shallow', 216, 'A Star Is Born', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, 'Silver Side Up', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, 'The Blueprint 3', '{"Al Shux"}'),
  ('Dark Horse', 215, 'Prism', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244,'Let Go', '{"The Matrix"}'),
  ('Say My Name', 240, 'The Writing''s on the Wall', '{"Darkchild"}');


CREATE TABLE song_info
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
  artists TEXT[] NOT NULL,
  release_date DATE NOT NULL
);

INSERT INTO song_info
  (song_id,artists,release_date)
VALUES
  (1,'{"Hanson"}','04-15-1997'),
  (2,'{"Queen"}','10-31-1975'),
  (3,'{"Mariah Cary", "Boyz II Men"}','11-14-1995'),
  (4,'{"Lady Gaga", "Bradley Cooper"}','09-27-2018'),
  (5,'{"Nickelback"}','08-21-2001'),
  (6,'{"Jay Z", "Alicia Keys"}','10-20-2009'),
  (7,'{"Katy Perry", "Juicy J"}','12-17-2013'),
  (8,'{"Maroon 5", "Christina Aguilera"}','06-21-2011'),
  (9,'{"Avril Lavigne"}','05-14-2002'),
  (10,'{"Destiny''s Child"}','11-07-1999');
