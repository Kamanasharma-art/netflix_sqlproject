# 🎬 Netflix Movies and TV Shows Data Project using SQL

![Netflix Logo](https://github.com/Kamanasharma-art/netflix_sqlproject/blob/main/logo.jpg)

## Project Overview
This project focuses on analyzing a Netflix Movies and TV Shows dataset using **PostgreSQL**.  
The goal is to perform **real-world SQL queries** to extract meaningful insights such as content distribution, genres, directors, release trends, and ratings.

This project is suitable for:
- SQL beginners to intermediate learners
- Data analysis practice
- Academic projects
- Entry-level database / data analyst portfolios


## Objectives
- To analyze Netflix movies and TV shows using PostgreSQL.
- To apply SQL queries to extract meaningful insights from real-world data.
- To study content distribution based on genre, type, director, and release year.
- To identify trends in content added to Netflix in recent years.
- To strengthen practical skills in SQL querying and database analysis.


## Schema
```sql
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
```
## Problems and Solutions

###1. Count the number of Movies vs TV Shows
   ```sql
     select 
	   type,
	   count(*) from netflix
	   group by 1;
   ```
###2. Find the most common rating for movies and TV shows

```sql
SELECT 
    type,
    rating AS most_frequent_rating
FROM RankedRatin
WHERE rank = 1;
```
###3. List all movies released in a specific year (e.g., 2020)
```sql
select type, release_year from netflix
	  where type like '%Movie' and release_year = '2020';
OR
	   select type, release_year from netflix
	  where type = 'Movie' and release_year = '2020';
```
###4. Find the top 5 countries with the most content on Netflix
```sql
    select
		unnest(STRING_TO_ARRAY(country, ',')) as country,
		count(*) as total_content
	from netflix
	group by 1
	order by 2 desc
	limit 5;
```
###5. Identify the longest movie

```sql
  select
	title, duration
from netflix
where type = 'Movie'
order by SPLIT_PART(duration, ' ', 1)::INT DESC
```
###6. Find content added in the last 5 years

```sql
    select type, title, date_added from netflix
where date_added >= Current_date- interval '5 years';
```
###7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

```sql
       select type, title, director from netflix
  where director = 'Rajiv Chilaka';
OR
  select type, title, director from netflix
     where director like 'Rajiv Chilaka';
```

###8. List all TV shows with more than 5 seasons

```sql
select type, duration from netflix 
	where type like'TV Show' and duration like '5 Seasons';
```
###9. Count the number of content items in each genre

```sql
select 
	 unnest(STRING_TO_ARRAY(listed_in, ',')) as genre,
	count(*) as total_content
	 from netflix
	 group by 1;
```

###10. List all movies that are documentaries

```sql
select type, listed_in, title from netflix
	   where type like'Movie' and listed_in like 'Documentaries';
```
###11. Find all content without a director
```sql
select * from netflix
	 where director is null;
```
###12. Find how many movies actor 'Salman Khan' appeared in last 10 years!

```sql
select title, casts from netflix
	  where casts like'%Salman Khan%' 
	  and date_added >= CURRENT_DATE - INTERVAL '10 years';
```
###13. Find the top 10 actors who have appeared in the highest number of movies produced in India.
```sql
 SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
```

  ## Finding and Outcomes
- Movies form a larger share of Netflix content than TV shows.
- Most content has been added in the last five years, showing rapid platform growth.
- Drama and international genres are the most common.
- TV-MA and TV-14 are the most frequent content ratings.
- The project improved practical skills in PostgreSQL, SQL querying, and data analysis using real-world datasets.

  ## This project is part of my portfolio, showcasing the SQL skills.
