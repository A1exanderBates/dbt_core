{{
    config(
        enabled=true,
        schema= 'garden_plants_dbt'
    )
}}
select * from {{source('VEGGIES','ROOT_DEPTH')}}

