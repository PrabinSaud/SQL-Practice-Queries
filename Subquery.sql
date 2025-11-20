USE Netflix;
SELECT * FROM Netflixdata;
#1. Find titles released in the same year as the newest title
SELECT title,release_year FROM Netflixdata
WHERE Release_year=(
	SELECT MAX(release_year) 
    FROM Netflixdata
);

#2.Show titles released in the same year as the oldest title in the dataset.
SELECT title, release_year FROM Netflixdata
WHERE release_year=(
	SELECT MIN(release_year)
    FROM Netflixdata
);
#3. Find actors who acted in more than 5 titles.
SELECT cast, COUNT(*) 
FROM Netflixdata
GROUP BY cast
HAVING COUNT(*) > 5;

SELECT * FROM (genredetail , castinfo);

#4. Find titles with the same rating as "Money Heist".
SELECT title 
FROM Netflixdata
WHERE rating=(
	SELECT rating 
    FROM Netflixdata
    WHERE title='Money Heist'
);



