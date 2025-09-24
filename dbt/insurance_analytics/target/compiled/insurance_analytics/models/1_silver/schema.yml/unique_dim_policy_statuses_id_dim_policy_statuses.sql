
    
    

select
    id_dim_policy_statuses as unique_field,
    count(*) as n_records

from "insurance_analytics"."dwh"."dim_policy_statuses"
where id_dim_policy_statuses is not null
group by id_dim_policy_statuses
having count(*) > 1


