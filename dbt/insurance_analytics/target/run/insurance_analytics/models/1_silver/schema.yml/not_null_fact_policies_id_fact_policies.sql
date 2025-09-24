
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_fact_policies
from "insurance_analytics"."dwh"."fact_policies"
where id_fact_policies is null



  
  
      
    ) dbt_internal_test