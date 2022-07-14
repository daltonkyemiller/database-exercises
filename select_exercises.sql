USE codeup_test_db;
SELECT name
FROM albums
WHERE artist = 'Pink Floyd';


SELECT release_date
FROM albums
WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT genre
FROM albums
WHERE name = 'Nevermind';


SELECT *
FROM albums
where release_date >= 1990
  AND release_date <= 1999;

SELECT *
FROM albums
WHERE sales < 20;


SELECT *
FROM albums
WHERE genre = 'Rock';