
    
    

with child as (
    select id_dim_policy_statuses as from_field
    from "insurance_analytics"."dwh"."fact_policies"
    where id_dim_policy_statuses is not null
),

parent as (
    select id_dim_policy_statuses as to_field
    from "insurance_analytics"."dwh"."dim_policy_statuses"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


