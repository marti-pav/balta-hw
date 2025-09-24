
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_dim_sales_channels
from "insurance_analytics"."dwh"."dim_sales_channels"
where id_dim_sales_channels is null



  
  
      
    ) dbt_internal_test