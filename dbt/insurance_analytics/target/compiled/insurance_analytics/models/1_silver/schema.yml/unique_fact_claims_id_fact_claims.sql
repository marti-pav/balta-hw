
    
    

select
    id_fact_claims as unique_field,
    count(*) as n_records

from "insurance_analytics"."dwh"."fact_claims"
where id_fact_claims is not null
group by id_fact_claims
having count(*) > 1


