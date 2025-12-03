/* ============================================================
   PROJECT TITLE: Netflix Dataset — SQL Analysis Project
   DESCRIPTION: This project contains 10 analytical SQL tasks
   based on the Netflix movies & TV shows dataset.
   Each task is written as a question for students to solve.
   ============================================================ */
use netflix;
select * from netflixdata;
/* ------------------------------------------------------------
   1. Find all Movies released after the year 2015.
   ------------------------------------------------------------ */
SELECT
type,
title
FROM netflixdata
WHERE
title = 'Movie' AND release_year = 2015;
/* ------------------------------------------------------------
   2. Identify all TV Shows that have more than 2 seasons.
   ------------------------------------------------------------ */
SELECT
type,
title,
duration
FROM netflixdata
WHERE type = 'TV Show'
AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 2;


/* ------------------------------------------------------------
   3. List all titles directed by a given director.
      (Example: Find all titles by "Mike Flanagan")
   ------------------------------------------------------------ */
SELECT 
title
FROM  netflixdata
WHERE director LIKE '%Mike Flanagan%';

/* ------------------------------------------------------------
   4. Count the number of titles produced by each country.
   ------------------------------------------------------------ */
SELECT 
country,
COUNT(*) AS total_titles
FROM netflixdata
GROUP BY country
ORDER BY total_titles DESC;


/* ------------------------------------------------------------
   5. Retrieve the latest 5 titles added to the Netflix platform.
   ------------------------------------------------------------ */
SELECT 
title,
date_added
FROM netflixdata
ORDER BY STR_TO_DATE(date_added, '%M %d, %Y') DESC
LIMIT 5;


/* ------------------------------------------------------------
   6. List all titles where "India" appears in the country field.
   ------------------------------------------------------------ */
SELECT 
title,
country
FROM netflixdata
WHERE country LIKE '%India%';


/* ------------------------------------------------------------
   7. Determine the most frequent rating category on the platform.
   ------------------------------------------------------------ */
SELECT 
rating,
COUNT(*) AS rating_count
FROM netflixdata
GROUP BY rating
ORDER BY rating_count DESC;


/* ------------------------------------------------------------
   8. Find all titles categorized under "Documentaries".
   ------------------------------------------------------------ */
SELECT 
title,
listed_in
FROM netflixdata
WHERE listed_in LIKE '%Documentaries%';

/* ------------------------------------------------------------
   9. List all titles where the cast contains the name "Kamal".
   ------------------------------------------------------------ */
SELECT 
title,
cast
FROM netflixdata
WHERE cast LIKE '%Kamal%';



/* ------------------------------------------------------------
   10. Identify titles with a description longer than 150 characters.
   ------------------------------------------------------------ */

SELECT 
title,
description,
LENGTH(description) AS desc_length
FROM netflixdata
WHERE LENGTH(description) > 150;
