{{
    config(
        enabled=true,
        schema= 'STAGING'
    )
}}

select * from {{ source('TESTING', 'SAMPLE_USERS')}}