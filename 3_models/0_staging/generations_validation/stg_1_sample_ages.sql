{{
    config(
        enabled=true,
        schema= 'STAGING'
    )
}}


with cte_1 as (
    select *,
        CAST(YEAR(current_date()) as INTEGER) as CURR_YEAR
    from {{source('AGES','SAMPLE_AGE_RANGE')}}
),

cte_2 as (
    select * exclude curr_year,
    CURR_YEAR - AGE as BIRTH_YEAR
    from cte_1
),

cte_3 as (
    select *,
        CASE
            WHEN BIRTH_YEAR >= 1997 AND BIRTH_YEAR <=2012 THEN 'Generation Z'
            WHEN BIRTH_YEAR >= 1981 AND BIRTH_YEAR <=1996 THEN 'Millennial'
            WHEN BIRTH_YEAR >= 1965 AND BIRTH_YEAR <=1980 THEN 'Generation X'
            WHEN BIRTH_YEAR >= 1946 AND BIRTH_YEAR <=1964 THEN 'Baby Boomer'
            WHEN BIRTH_YEAR >= 1928 AND BIRTH_YEAR <= 1945 THEN 'Silent Generation'
        END AS GENERATION_BUCKET --This is the column name for generation
    from cte_2
)

select * from cte_3


