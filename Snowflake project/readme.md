

list_table:  
-username: varchar -- _username of the streamer_  
-is_live: binary -- _is the streamer currently on live_  

info_table:  
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

stats_table:  
-last_blitz: numeric -- _elo of the last blitz game (3 to 5min game)_  
-draw_blitz: numeric  -- _number of draws in blitz games_  
-loss_blitz: numeric  -- _number of losses in blitz games_  
-win_blitz: numeric  -- _number of wins in blitz games_  
-last_bullet: numeric  -- _elo of the last bullet game (less than 2min game)_  
-draw_bullet: numeric  
-loss_bullet: numeric  
-win_bullet: numeric  
-last_rapid: numeric  -- _elo of the last rapid game (over 10min game)_  
-draw_rapid: numeric  
-loss_rapid: numeric  
-win_rapid: numeric  
-FIDE: numeric -- _official FIDE ranking_  
-primary_key: numeric  
