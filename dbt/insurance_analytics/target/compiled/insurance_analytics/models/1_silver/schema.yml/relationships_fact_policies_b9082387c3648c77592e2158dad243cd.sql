
    
    

with child as (
    select id_dim_customers as from_field
    from "insurance_analytics"."dwh"."fact_policies"
    where id_dim_customers is not null
),

parent as (
    select id_dim_customers as to_field
    from "insurance_analytics"."dwh"."dim_customers"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


