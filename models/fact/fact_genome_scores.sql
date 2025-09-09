with genome_scores as (
    select * from {{ ref('src_genome_scores') }}
    
)

select 
    movie_id,
    tag_id,
    round(relevance,4) as relevance_score
    from genome_scores
        where relevance > 0