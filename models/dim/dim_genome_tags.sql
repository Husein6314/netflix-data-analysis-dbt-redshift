with genome_tags as (
    select * from{{ ref('src_genome_tags') }}
)

select 
        tag_id,
        initcap(trim(tags)) as tag_name
    from genome_tags