USE codeup_test_db;
SELECT * FROM albums WHERE release_date > 1991;
SELECT * FROM albums  WHERE genre = 'Rock';
SELECT * FROM albums WHERE artist = 'Whitney Houston';

DELETE FROM albums WHERE release_date > 1991;
DELETE FROM albums WHERE genre LIKE 'Rock';
DELETE FROM albums WHERE artist = 'Whitney Houston';

SELECT * FROM albums;