{{
    config(
        materialized = 'table')
}}
with raw_tags as (
    select * from netflix_database.raws.tags
)
select  
    userId as user_id,
    movieId as movie_id,
    "tag" as tag_value,
    (TIMESTAMP 'epoch' + "timestamp"::BIGINT * INTERVAL '1 second') as tag_timestamp
from raw_tags