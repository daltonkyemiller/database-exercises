USE codeup_test_db;
UPDATE albums SET sales = sales * 10;

UPDATE albums SET release_date = release_date - 100 WHERE release_date < 1980;
UPDATE albums SET artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';

SELECT * FROM albums as 'All Albums';
SELECT * FROM albums WHERE release_date < 1980 as `Released before 1980`;
SELECT * FROM albums WHERE artist = 'Peter Jackson'; as `Peter Jackson albums`;
