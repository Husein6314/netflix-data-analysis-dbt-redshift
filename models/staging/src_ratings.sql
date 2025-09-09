with raw_ratings as (
    select * from netflix_database.raws.ratings
)
select
    userid as user_id,
    movieid as movie_id,
    rating,
    (timestamp 'epoch' + "timestamp" * interval '1 second') as rating_timestamp
from raw_ratings