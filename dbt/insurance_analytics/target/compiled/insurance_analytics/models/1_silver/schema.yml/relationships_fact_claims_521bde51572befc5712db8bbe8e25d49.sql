
    
    

with child as (
    select id_fact_policies as from_field
    from "insurance_analytics"."dwh"."fact_claims"
    where id_fact_policies is not null
),

parent as (
    select id_fact_policies as to_field
    from "insurance_analytics"."dwh"."fact_policies"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


