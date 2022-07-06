USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
  id serial PRIMARY KEY,
  artist VARCHAR(255),
  name VARCHAR(255),
  release_date DATE,
  sales FLOAT,
  genre VARCHAR(255)
);