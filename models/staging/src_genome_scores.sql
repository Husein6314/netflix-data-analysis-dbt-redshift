with raw_genome_scores as (
    select * from netflix_database.raws.genome_scores
)

select  movieId as movie_id,
        tagId as tag_id,
        relevance
from raw_genome_scores