
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_dim_locations
from "insurance_analytics"."dwh"."dim_customers"
where id_dim_locations is null



  
  
      
    ) dbt_internal_test