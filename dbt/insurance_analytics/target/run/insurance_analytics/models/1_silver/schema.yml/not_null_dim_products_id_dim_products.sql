
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_dim_products
from "insurance_analytics"."dwh"."dim_products"
where id_dim_products is null



  
  
      
    ) dbt_internal_test