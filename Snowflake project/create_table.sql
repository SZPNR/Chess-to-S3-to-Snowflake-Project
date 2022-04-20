-- list_table

create or replace table list_table as (
SELECT json_object.value:"username" AS username, json_object.value:"is_live" as is_live
FROM (select * from temp_pipe_list) as list_table, LATERAL FLATTEN (input => PARSE_JSON(list_table.$1:streamers)) json_object);
select * from list_table;

-- info_table

create or replace table info_table_temp as (
SELECT json_object.value:"username" as username,
  json_object.value:"followers" AS followers,
  right(json_object.value:"country",2) as country,
  date(json_object.value:"joined") as joined,
  json_object.value:"location" as location,
  json_object.value:"name" as name,
  json_object.value:"player_id" as player_id,
  json_object.value:"status" as status,
  json_object.value:"title" as title
  FROM (select * from temp_pipe_info) as info_table_temp, LATERAL FLATTEN (input => PARSE_JSON(info_table_temp.$1)) json_object);

--add identity column in order to connect info table and stats table

select * from info_table_temp;
create or replace table info_table LIKE info_table_temp;
ALTER TABLE info_table ADD COLUMN primary_key int IDENTITY(1,1);
create or replace sequence seq_01 start = 1 increment = 1;
INSERT INTO info_table
SELECT *,seq_01.NEXTVAL FROM info_table_temp;

SELECT * FROM info_table;

-- stats table

create or replace table stats_table_temp as (
SELECT
  json_object.value:"chess_blitz"."last"."rating" as last_blitz,
  json_object.value:"chess_blitz"."record"."draw" as draw_blitz,
  json_object.value:"chess_blitz"."record"."loss" as loss_blitz,
  json_object.value:"chess_blitz"."record"."win" as win_blitz,
  json_object.value:"chess_bullet"."last"."rating" as last_bullet,
  json_object.value:"chess_bullet"."record"."draw" as draw_bullet,
  json_object.value:"chess_bullet"."record"."loss" as loss_bullet,
  json_object.value:"chess_bullet"."record"."win" as win_bullet,
  json_object.value:"chess_rapid"."last"."rating" as last_rapid,
  json_object.value:"chess_rapid"."record"."draw" as draw_rapid,
  json_object.value:"chess_rapid"."record"."loss" as loss_rapid,
  json_object.value:"chess_rapid"."record"."win" as win_rapid,
  json_object.value:"fide" as fide
from (select * from temp_pipe_stats) as stats_table_temp, LATERAL FLATTEN (input => PARSE_JSON(stats_table_temp.$1)) json_object);

--add identity column in order to connect info table and stats table 

select * from stats_table_temp;
create or replace table stats_table LIKE stats_table_temp;
ALTER TABLE stats_table ADD COLUMN primary_key int IDENTITY(1,1);
create or replace sequence seq_01 start = 1 increment = 1;
INSERT INTO stats_table
SELECT *,seq_01.NEXTVAL FROM stats_table_temp;

SELECT * FROM stats_table;
