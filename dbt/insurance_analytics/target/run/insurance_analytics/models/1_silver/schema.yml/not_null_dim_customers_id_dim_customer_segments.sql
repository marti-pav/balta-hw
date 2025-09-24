
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_dim_customer_segments
from "insurance_analytics"."dwh"."dim_customers"
where id_dim_customer_segments is null



  
  
      
    ) dbt_internal_test