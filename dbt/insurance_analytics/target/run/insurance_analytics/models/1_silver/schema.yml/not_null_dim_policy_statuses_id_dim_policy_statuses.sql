
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_dim_policy_statuses
from "insurance_analytics"."dwh"."dim_policy_statuses"
where id_dim_policy_statuses is null



  
  
      
    ) dbt_internal_test