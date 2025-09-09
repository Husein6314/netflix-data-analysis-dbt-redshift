with rating as (
    select distinct user_id from {{ ref('src_ratings') }}
),
tags as (
    select distinct user_id from {{ ref('src_tags') }}
)

select * from (
    select user_id from rating
    union
    select user_id from tags
)