# Chess to S3 to Snowflake Project

`Data pipeline collecting useful information about streamers on chess.com, storing this data in S3 and modeling it on Snowflake`


## General information

This project aims to extract data from chess.com APIs with a python script.
The data is then sent to a Data Lake in the form of three json files. As soon as the data is loaded into the Data Lake, it is ingested into an SQS Queue and then sent to a Snowflake Data Warehouse via a Snowpipe Pipeline. Finally, the data is analyzed with SQL queries in the Snowflake tables. The execution of the script is orchestrated by Airflow to operate every hour.

The approximately 600kb database is made up of streamers verified by chess.com, many of whom represent professional chess players. There are three main categories of games:
- blitz games, duration between 3 and 5min (not counting additional seconds)
- bullet games, duration of less than 2min
- rapid games, duration of more than 10min

Even if the database is very small, however, it allowed me to learn more about how data pipelines work.
This size is partly explained by the fact that I use the free trial version of AWS S3.

## Visual explanation

Fig1. Visual explanation of how the data pipeline works
![image](https://user-images.githubusercontent.com/94069984/164280584-9c8d7f87-c38f-4497-b3bc-ad6495e57f0b.png)

## Files

### Snowflake project and S3 Data Lake project

The operation of the Data Lake and the Data Warehouse are explained in their corresponding file.

### Python script 

The python script first sends a request to the "streamers" API to get a list of all streamers on the platform. Then for each streamer the script sends a request for its general information and the statistics of these parts.

### Airflow project

The Airflow python script allows you to launch the API python script every hour in order to update the list of streamers who are currently live as well as the statistics of their games. Due to the fact that Data Lake data is automatically sent to the Data Warehouse, only the Airflow scheduler role is used.

## Contact

Feel free to contact me at @SZPNR for further information or on linkedin:  
