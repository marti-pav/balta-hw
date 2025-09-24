
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_fact_claims
from "insurance_analytics"."dwh"."fact_claims"
where id_fact_claims is null



  
  
      
    ) dbt_internal_test