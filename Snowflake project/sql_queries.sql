-- by player by category (blitz, bullet, rapid)

create table best_blitz as (
select info_table.username, stats_table.last_blitz as best_blitz
from stats_table join info_table
on stats_table.primary_key = info_table.primary_key
where last_blitz = (
    select max(last_blitz) from stats_table));

create table best_bullet as (
select info_table.username, stats_table.last_bullet as best_bullet
from stats_table join info_table
on stats_table.primary_key = info_table.primary_key
where last_bullet = (
    select max(last_bullet) from stats_table));

create table best_rapid as (
select info_table.username, stats_table.last_rapid as best_rapid
from stats_table join info_table
on stats_table.primary_key = info_table.primary_key
where last_rapid = (
    select max(last_rapid) from stats_table));
    
select *
from best_blitz join best_bullet join best_rapid;

-- full name or username of best player by country


select
    ifnull(info_table.name, info_table.username) as "Name or username",
    best.country,
    best.best_blitz,
    stats_table.FIDE
from info_table
    join stats_table 
        on info_table.primary_key = stats_table.primary_key
    join (
      select info_table.country, max(stats_table.last_blitz) as best_blitz
      from stats_table join info_table
      on stats_table.primary_key = info_table.primary_key
      group by info_table.country) as best
        on stats_table.last_blitz = best.best_blitz
order by best.best_blitz desc;


-- avg elo by status (premium, staff, basic)

select info_table.status,
round(avg(stats_table.last_blitz),2) as average_blitz,
round(avg(stats_table.last_bullet),2) as average_bullet,
round(avg(stats_table.last_rapid),2) as average_rapid,
count(info_table.country) as number_of_streamers
from info_table right join stats_table
on info_table.primary_key = stats_table.primary_key
group by info_table.status
having average_blitz is not null
or average_bullet is not null
or average_rapid is not null
order by number_of_streamers desc, average_blitz desc, average_bullet desc, average_rapid desc;

-- combien ont un title ? leur score moyen ? 

select count(info_table.title)
from info_table;

select info_table.username, info_table.title, stats_table.FIDE
from stats_table join info_table
on stats_table.primary_key = info_table.primary_key
where stats_table.FIDE is not null
order by stats_table.FIDE desc;

-- avg by title 

select info_table.title, avg(stats_table.FIDE) as average_FIDE
from stats_table join info_table
on stats_table.primary_key = info_table.primary_key
where stats_table.FIDE is not null and (info_table.title is not null)
group by info_table.title
order by average_FIDE desc;


-- best player on live 

select info_table.username, stats_table.last_blitz, stats_table.last_bullet, stats_table.last_rapid
from info_table
join stats_table
on info_table.primary_key = stats_table.primary_key
join list_table
on lower(info_table.username) = lower(list_table.username)
where list_table.is_live = TRUE and (last_blitz is not null or last_bullet is not null or last_rapid is not null)
order by last_blitz desc, last_bullet desc, last_rapid desc;
