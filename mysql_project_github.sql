SELECT * FROM mysql_project.netflix_titles;

-- 1.count the number of movies vs tv shows 
select type,count(*) as count_of_type from netflix_titles
group by type;
--   or
select type,count(type) as count_of_type from netflix_titles
group by type; 

-- most commam rating for movies and tvshows 

select type,rating,
count(*),
rank() over(partition by type order by count(*) desc) as ranking
from netflix_titles
group by 1,2;

-- subqueryy 
select type,rating from 
(
select type,rating,count(*),
rank() over(partition by  type order by count(*) desc) as ranking
from netflix_titles
group by 1,2

)as t1 
where ranking=1;

-- --list  all movies  released in a sepcific year(eg 2021)

select * from netflix_titles
where 
type='movie'
and
release_year=2021;


select country,count(show_id) from netflix_titles
group by 1;











