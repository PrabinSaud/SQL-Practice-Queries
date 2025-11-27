#Show all rows from the table.
SELECT * FROM Netflixdata;

# 2. Display only title, type, and release_year.
SELECT title,type,release_year FROM Netflixdata;

# 3. Show title and country.
SELECT title,country FROM Netflixdata;

# 4. Show all Movies.
SELECT title, type FROM Netflixdata WHERE type ="Movie";

# 5. Show all TV Shows.
SELECT title, type FROM Netflixdata WHERE type ="TV Show";

# 6. Show all titles released in 2020.
SELECT title, release_year FROM Netflixdata WHERE release_year =2020;

# 7. Show all titles from India.
SELECT title, country FROM Netflixdata WHERE country ="India";

# 8. Show titles that have rating 'TV-MA'.
SELECT title, rating FROM Netflixdata WHERE rating ="TV-MA";

# 9. Show titles with director 'Kirsten Johnson'.
SELECT title, director FROM Netflixdata WHERE director ="Kirsten Johnson";

# 10. List all unique countries.
SELECT country FROM Netflixdata GROUP BY country;

# 11. List all unique ratings.
SELECT rating FROM Netflixdata GROUP BY rating;

# 12. List all unique types.
SELECT type FROM Netflixdata GROUP BY type;

# 13. Show all movies ordered by release year (latest first).
SELECT title, release_year FROM Netflixdata WHERE type = 'Movie' ORDER BY release_year DESC;


# 14. Show all titles ordered A–Z by title.
SELECT title FROM Netflixdata ORDER BY (title) ASC;

# 15. Show all titles ordered Z–A by title.
SELECT title FROM Netflixdata ORDER BY (title) DESC;

# 16. Find all titles that contain the word "Love".
SELECT title FROM Netflixdata WHERE title LIKE "%love%";

# 17. Find all titles whose description contains "crime".
SELECT title, description FROM Netflixdata WHERE description LIKE "%crime%";

# 18. Find all titles starting with "K".
SELECT title FROM Netflixdata WHERE title LIKE "K%";

# 19. Count how many total titles are in the table.
SELECT COUNT(title) FROM Netflixdata;

# 20. Count how many movies are in the table.
SELECT COUNT(*) FROM Netflixdata WHERE type = 'Movie';

# 21. Count how many TV shows are in the table.
SELECT COUNT(*) FROM Netflixdata WHERE type = 'TV Show';

# 22. Count titles released in 2021.
SELECT COUNT(*) FROM Netflixdata WHERE release_year = 2021;

# 23. Count all Indian titles.
SELECT COUNT(*) FROM Netflixdata WHERE country = 'India';

# 24. Count all titles with rating "PG-13".
SELECT COUNT(*) FROM Netflixdata WHERE rating = 'PG-13';

# 25. Show all rows where director is NULL.
SELECT COUNT(*) FROM Netflixdata WHERE director IS NULL;

# 26. Show all rows where cast is NULL.
SELECT COUNT(*) FROM Netflixdata WHERE cast IS NULL;

# 27. Show all titles added in September 2021.
SELECT title,date_added FROM Netflixdata WHERE date_added LIKE '%-Sep-21';

# 28. Show titles added on 24-Sep-21.
SELECT title, date_added FROM Netflixdata WHERE date_added LIKE '24-Sep-21';