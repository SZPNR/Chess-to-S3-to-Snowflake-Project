# Implementing Data Warehouse on Snowflake

` The goal of this project is to route the data from the SQS Queue through a Snowflake Pipeline (Snowpipe), to transform this data into a relational data table and then to extract useful information through SQL queries.`

## General information

In this project we want to extract the three JSON objects "list", "stats" and "info" located in the S3 data lake "chess-bucket". To facilitate this transfer we have created to store the data in an SQS Queue which we must now use to route the data to the Data >arehouse.
For this we have created a Snowpipe which copies data into a json table on Snowflake. From this json table we have created a table by recovering only the necessary columns which are:

#### list_table:  
<pre>
-username: varchar -- _username of the streamer_  
-is_live: binary -- _is the streamer currently on live_  
</pre>

#### info_table:  
<pre>
-username: varchar  -- _username of the streamer_  
-followers: numeric -- _number of followers of twitch_    
-country: varchar  -- _country of the streamer_  
-joined: date -- _date the streamer joined chess.com_  
-location: varchar -- _city of the streamer_  
-name: varchar -- _full name of the streamer_  
-player_id: numeric 
-status: varchar -- _premium, admin, staff, basic_  
-title: varchar -- _FIDE title_  
-primary_key: numeric  
</pre>
#### stats_table:  
<pre>
-last_blitz: numeric -- _elo of the last blitz game (3 to 5min game)_  
-draw_blitz: numeric  -- _number of draws in blitz games_  
-loss_blitz: numeric  -- _number of defeats in blitz games_  
-win_blitz: numeric  -- _number of wins in blitz games_  
-last_bullet: numeric  -- _elo of the last bullet game (less than 2min game)_  
-draw_bullet: numeric  -- _number of draws in bullet games_  
-loss_bullet: numeric  -- _number of defeats in bullet games_  
-win_bullet: numeric  -- _number of wins in bullet games_  
-last_rapid: numeric  -- _elo of the last rapid game (over 10min game)_  
-draw_rapid: numeric  -- _number of draws in rapid games_  
-loss_rapid: numeric  -- _number of defeats in rapid games_  
-win_rapid: numeric  -- _number of wins in rapid games_  
-FIDE: numeric -- _official FIDE ranking_  
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
