use netflix;
SELECT * FROM Netflixdata;
SELECT title FROM Netflixdata;
SELECT title, release_year FROM Netflixdata WHERE title = 'Blood & Water';
SELECT title, release_year FROM Netflixdata WHERE release_year = 2020 OR release_year= 2021;
SELECT title, release_year, duration FROM Netflixdata WHERE release_year = 2020 OR release_year= 2021 AND duration=" 3 Seasons";
SELECT title, release_year, duration FROM Netflixdata WHERE release_year=2021 AND duration="3 Seasons";
SELECT title, release_year, duration FROM Netflixdata WHERE duration="3 Seasons";
SELECT title, release_year FROM Netflixdata WHERE title LIKE '%money%';
SELECT title, release_year FROM Netflixdata WHERE title LIKE '%THE%' LIMIT 5;
SELECT title, release_year FROM Netflixdata ORDER BY release_year = 2020 OR release_year= 2021 DESC LIMIT 10;
SELECT AVG(duration) FROM Netflixdata;
SELECT ROUND(AVG(duration),1) FROM Netflixdata;
SELECT COUNT(*) FROM Netflixdata;
SELECT SUM(duration) FROM Netflixdata;
SELECT title, director FROM Netflixdata WHERE director="Toshiya Shinohara";
SELECT MAX(duration) FROM Netflixdata;
SELECT MAX(duration) AS "MAX Duration" FROM Netflixdata;
SELECT MIN(duration) FROM Netflixdata;
SELECT MAX(release_year) FROM Netflixdata;
SELECT MIN(release_year) FROM Netflixdata;
SELECT title,release_year FROM Netflixdata WHERE release_year= 1975;


