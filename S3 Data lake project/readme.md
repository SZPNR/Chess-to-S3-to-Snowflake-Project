![image](https://user-images.githubusercontent.com/94069984/164285817-880738c5-be0c-4db9-8e1e-987e70624986.png)

list file presented as 
<pre>
{  
  "username": "string",  
  "avatar": "URL",  
  "twitch_url": "Twitch.tv URL",  
  "url":"member url's"  
  "is_live": true  
}  
</pre>

info file presented as:
<pre>
{
  "@id": "URL", // the location of this profile (always self-referencing)
  "url": "URL", // the chess.com user's profile page (the username is displayed with the original letter case)
  "username": "string", // the username of this player
  "player_id": 41, // the non-changing Chess.com ID of this player
  "title": "string", // (optional) abbreviation of chess title, if any
  "status": "string", // account status: closed, closed:fair_play_violations, basic, premium, mod, staff
  "name": "string", // (optional) the personal first and last name
  "avatar": "URL", // (optional) URL of a 200x200 image
  "location": "string", // (optional) the city or location
  "country": "URL", // API location of this player's country's profile
  "joined": 1178556600, // timestamp of registration on Chess.com
  "last_online": 1500661803, // timestamp of the most recent login
  "followers": 17 // the number of players tracking this player's activity
  "is_streamer": "boolean", //if the member is a Chess.com streamer
  "twitch_url": "Twitch.tv URL",
  "fide": "integer" // FIDE rating
}
</pre>
stats file presentend as: 
<pre>
{  
  "chess_daily": {  
    /* stats object for games of rules "chess" and "daily" time-class */  
  },  
  "chess960_daily": {  
    /* stats object for games of rules "chess960" and "daily" time-class */  
  },  
  "chess_blitz": {  
    /* stats object for games of rules "chess" and "blitz" time-class */  
  },  
  "tactics": {  
      "highest": {  
          "rating": "integer",  
          "date": "timestamp"  
      },  
      "lowest": {  
          "rating": "integer",  
          "date": "timestamp"  
      }  
  },  
  "lessons":{  
      "highest": {  
          "rating": "integer",  
          "date": "timestamp"  
      },  
      "lowest": {  
          "rating": "integer",  
          "date": "timestamp"  
      }  
  },  
  "puzzle_rush": {  
      "daily":{   
          "total_attempts": "integer",  
          "score": "integer"  
       },  
      "best": {  
          "total_attempts": "integer",  
          "score": "integer"  
       }  
   }  
}  
</pre>
