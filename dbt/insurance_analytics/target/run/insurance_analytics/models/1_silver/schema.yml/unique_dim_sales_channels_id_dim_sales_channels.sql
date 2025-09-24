
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    id_dim_sales_channels as unique_field,
    count(*) as n_records

from "insurance_analytics"."dwh"."dim_sales_channels"
where id_dim_sales_channels is not null
group by id_dim_sales_channels
having count(*) > 1



  
  
      
    ) dbt_internal_test