# S3 Data Lake Project

` The goal is to load data from the chess.com APIs and store them into three different and raw json files. The data will then be transferred and transformed in a data warehouse in Snowflake.`

## General information

In order not to exceed the limit authorized by the free version of AWS S3, I focused on a small database of less than one gigabyte. The data lake receives data from a python script and stores it as is. To not lose information for other users of the database I decided not to delete information from json files for the moment.

To send the data to Snowflake I created an SQS event notification which ingests the data into SQS Queue and which will then be processed by Snowflake.

## Screenshot

Fig1. Screenshot of the bucket in AWS S3
![image](https://user-images.githubusercontent.com/94069984/164285817-880738c5-be0c-4db9-8e1e-987e70624986.png)

## Metadata

#### List file

<pre>
{  
  "username": "string",  
  "avatar": "URL",  
  "twitch_url": "Twitch.tv URL",  
  "url":"member url's"  
  "is_live": true  
}  
</pre>

#### Info file
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
#### Stats file
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

## Contact

https://www.linkedin.com/in/simon-szpunar-9b9ba7144/
