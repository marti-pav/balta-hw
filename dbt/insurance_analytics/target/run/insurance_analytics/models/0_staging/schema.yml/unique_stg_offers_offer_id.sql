
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    offer_id as unique_field,
    count(*) as n_records

from "insurance_analytics"."staging_csv"."stg_offers"
where offer_id is not null
group by offer_id
having count(*) > 1



  
  
      
    ) dbt_internal_test