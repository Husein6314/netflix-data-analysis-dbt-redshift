{% snapshot snap_tags %}

{{
    config(
        target_schema='snapshots',
        unique_key=['user_id','movie_id','tag_value'],
        strategy='timestamp',
        updated_at='tag_timestamp',
        invalidate_hard_deletes=True
    )
}}

select
    {{ dbt_utils.generate_surrogate_key(['user_id','movie_id','tag_value']) }} as row_key,
    user_id,
    movie_id,
    tag_value,
    cast(tag_timestamp as timestamp) as tag_timestamp
from {{ ref('src_tags') }}
limit 100

{% endsnapshot %}

