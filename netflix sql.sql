--Netflix Project
--Create Table

Drop table if exists netflix;
Create table netflix
(
show_id Varchar(10) primary key,
type Varchar(10),
title Varchar(110),
director Varchar(210),
casts Varchar(1000),
country Varchar(150),
date_added Date,
release_year Int,
rating  Varchar(25),
duration Varchar(10),
listed_in Varchar(100),
description Varchar(250)
);

select * from netflix;

 select Count(*) from netflix;

--1. Count the number of Movies vs TV Shows

     select 
	   type,
	   count(*) from netflix
	   group by 1;

--2. Find the most common rating for movies and TV shows

SELECT 
    type,
    rating AS most_frequent_rating
FROM netflix
WHERE rank = 1;

--3. List all movies released in a specific year (e.g., 2020)

      select type, release_year from netflix
	  where type like '%Movie' and release_year = '2020';

	   select type, release_year from netflix
	  where type = 'Movie' and release_year = '2020';
	 
--4. Find the top 5 countries with the most content on Netflix

     select 
	 UNNEST(STRING_TO_ARRAY(country, ',')) as country,
	 count(*) as total_content
	from netflix
	group by 1
	order by 2 desc
	limit 5;

--5. Identify the longest movie
select * from netflix
SELECT 
	type, duration
FROM netflix
WHERE type = 'Movie'
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC;
--6. Find content added in the last 5 years

        select type, date_added from netflix 
		where date_added >= CURRENT_DATE - INTERVAL '5 years';
  
--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

      select type, director from netflix
	  where director LIKE'Rajiv Chilaka';

--8. List all TV shows with more than 5 seasons

    select type, duration from netflix 
	where type like'TV Show' and duration like '5 Seasons';

	select type, duration from netflix 
	where type ='TV Show' and duration ='5 Seasons';
	
--9. Count the number of content items in each genre

     select 
	 unnest(STRING_TO_ARRAY(listed_in, ',')) as genre,
	 count(*) as total_content
	 from netflix
	 group by 1;

/*10.Find each year and the average numbers of content release in India on netflix. 
return top 5 year with highest avg content release!*/
--11. List all movies that are documentaries
select * from netflix
       select type, listed_in, title from netflix
	   where type like'Movie' and listed_in like 'Documentaries';

--12. Find all content without a director

     select * from netflix
	 where director is null;
	 
--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

      select title, casts from netflix
	  where casts like'%Salman Khan%' 
	  and date_added >= CURRENT_DATE - INTERVAL '10 years';


--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

    SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

