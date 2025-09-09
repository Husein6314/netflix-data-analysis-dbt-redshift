with src_movies as (
    select * from {{ ref('src_movies') }}
)

select
    movie_id,
    initcap(trim(title)) as movie_title,
    split_to_array(genres, '|') as genres_array,
    genres
from src_movies
