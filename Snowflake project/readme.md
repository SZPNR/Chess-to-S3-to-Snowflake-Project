# Implementing Data Warehouse on Snowflake

` The goal of this project is to route the data from the SQS Queue through a Snowflake Pipeline (Snowpipe), to transform this data into a relational data table and then to extract useful information through SQL queries.`

## Files

`create_table.sql` create the three different tables for the data  
`snowpipe_S3_to_Snowflake` create the data pipeline and the stages to transfer the data from the SQS Queue  
`sql_queries` transform in order to retrieve useful information from the data  

## General information

In this project we want to extract the three JSON objects "list", "stats" and "info" located in the S3 data lake "chess-bucket". To facilitate this transfer we have created to store the data in an SQS Queue which we must now use to route the data to the Data >arehouse.
For this we have created a Snowpipe which copies data into a json table on Snowflake. From this json table we have created a table by recovering only the necessary columns which are:

#### list_table:  
<pre>
-username: varchar -- username of the streamer
-is_live: binary -- is the streamer currently on live
</pre>

#### info_table:  
<pre>
-username: varchar  -- username of the streamer
-followers: numeric -- number of followers of twitch
-country: varchar  -- country of the streamer
-joined: date -- date the streamer joined chess.com
-location: varchar -- city of the streamer
-name: varchar -- full name of the streamer
-player_id: numeric
-status: varchar -- premium, admin, staff, basic 
-title: varchar -- FIDE title
-primary_key: numeric  
</pre>
#### stats_table:  
<pre>
-last_blitz: numeric -- elo of the last blitz game (3 to 5min game)
-draw_blitz: numeric  -- number of draws in blitz games
-loss_blitz: numeric  -- number of defeats in blitz games
-win_blitz: numeric  -- number of wins in blitz games
-last_bullet: numeric  -- elo of the last bullet game (less than 2min game)
-draw_bullet: numeric  -- number of draws in bullet games
-loss_bullet: numeric  -- number of defeats in bullet games
-win_bullet: numeric  -- number of wins in bullet games
-last_rapid: numeric  -- elo of the last rapid game (over 10min game)
-draw_rapid: numeric  -- number of draws in rapid games
-loss_rapid: numeric  -- number of defeats in rapid games
-win_rapid: numeric  -- number of wins in rapid games
-FIDE: numeric -- official FIDE ranking
-primary_key: numeric  
</pre>

## Results

Thanks to SQL queries we retrieved this information:

- Username of the best player by category (blitz, chess, bullet)
- Full name (or username if null) of the best player and his FIDE elo
- Average elo of premium, staff and basic players
- Number of professional players and their elo 
- Average FIDE elo by their professional FIDE elo
- Best player currently on live

## Contact

https://www.linkedin.com/in/simon-szpunar-9b9ba7144/
