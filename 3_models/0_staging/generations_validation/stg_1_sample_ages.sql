{{
    config(
        enabled=true,
        schema='STAGING'
    )
}}


select * from {{source('SAMPLE_AGES','SAMPLE_AGE_RANGE')}}

/*
with cte_1 as (
    select *,
        CAST(YEAR(current_date()) as INTEGER) as CURR_YEAR
    from {{source('testing','sample_age_range')}}
),


cte_2 as (
    select * exclude curr_year,
    CURR_YEAR - AGE as BIRTH_YEAR
    from cte_1
),

cte_3 as (
    select *,
        CASE
            WHEN BIRTH_YEAR <1928 THEN 'Greatest Generation'
            WHEN BIRTH_YEAR >= 1928 AND BIRTH_YEAR <=1946 THEN 'Silent Generation'
            WHEN BIRTH_YEAR >= 1946 AND BIRTH_YEAR <1964 THEN 'Baby Boomer'
            WHEN BIRTH_YEAR >= 1964 AND BIRTH_YEAR <1976 THEN 'Gen X'
            WHEN BIRTH_YEAR >= 1977 AND BIRTH_YEAR <1995 THEN 'Millennial'
            WHEN BIRTH_YEAR >= 1995 AND BIRTH_YEAR <2010 THEN 'Gen Z'
            WHEN BIRTH_YEAR >= 2010 AND BIRTH_YEAR <2024 THEN 'Gen Alpha'
        END AS Generation_Bucket
    from cte_2
)

select * from cte_3
*/