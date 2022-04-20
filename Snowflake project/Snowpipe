CREATE OR REPLACE STORAGE INTEGRATION CHESS_SI
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = true
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::409211792427:role/snowflake-role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://my-chess-bucket/list', 's3://my-chess-bucket/info', 's3://my-chess-bucket/stats');
  
DESC INTEGRATION CHESS_SI;

create or replace file format json_format
  type = 'json';
  
-- loading of the LIST json file

create or replace stage list_stage
    url = 's3://my-chess-bucket/list'
    storage_integration = CHESS_SI
    file_format = json_format;

select * from @list_stage;

create or replace table temp_pipe_list (v variant);

create or replace pipe list_pipe
  auto_ingest = true
  as
  copy into temp_pipe_list
  from @list_stage
  file_format = (type = 'JSON');
  
select * from temp_pipe_list;
  
-- loading of the INFO json file

create or replace stage info_stage
    url = 's3://my-chess-bucket/info'
    storage_integration = CHESS_SI
    file_format = json_format;

select * from @info_stage;

create or replace table temp_pipe_info (v variant);

create or replace pipe info_pipe
  auto_ingest = true
  as
  copy into temp_pipe_info
  from @info_stage
  file_format = (type = 'JSON');
  
select * from temp_pipe_info;

-- loading of the STATS json file

CREATE OR REPLACE STAGE stats_stage
    url = 's3://my-chess-bucket/stats'
    storage_integration = CHESS_SI
    file_format = json_format;
    
select * from @stats_stage;

create or replace table temp_pipe_stats (v variant);

create or replace pipe stats_pipe
  auto_ingest = true
  as
  copy into temp_pipe_stats
  from @stats_stage
  file_format = (type = 'JSON');
  
select * from temp_pipe_stats;
