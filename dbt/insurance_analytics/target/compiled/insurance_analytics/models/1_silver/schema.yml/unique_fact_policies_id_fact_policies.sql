
    
    

select
    id_fact_policies as unique_field,
    count(*) as n_records

from "insurance_analytics"."dwh"."fact_policies"
where id_fact_policies is not null
group by id_fact_policies
having count(*) > 1


