
    
    

with child as (
    select id_dim_products as from_field
    from "insurance_analytics"."dwh"."fact_claims"
    where id_dim_products is not null
),

parent as (
    select id_dim_products as to_field
    from "insurance_analytics"."dwh"."dim_products"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


