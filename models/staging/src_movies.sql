with raw_movies as (
    select * from netflix_database.raws.movies
)

select movieId as movie_id,
        title,
        genres
from raw_movies