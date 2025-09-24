
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    id_fact_claims as unique_field,
    count(*) as n_records

from "insurance_analytics"."dwh"."fact_claims"
where id_fact_claims is not null
group by id_fact_claims
having count(*) > 1



  
  
      
    ) dbt_internal_test