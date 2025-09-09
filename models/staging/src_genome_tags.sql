with raw_genome_tags as (
    select * from netflix_database.raws.genome_tags
)

select  tagId as tag_id,
        "tag" as tags
from raw_genome_tags