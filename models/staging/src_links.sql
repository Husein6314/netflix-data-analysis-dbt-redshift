with raw_links as (
    select * from netflix_database.raws.links
)

select movieId as movie_id,
        imdbId as imdbt_id,
        tmdbId as tmdbt_id
from raw_links