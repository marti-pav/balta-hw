
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    id_fact_policies as unique_field,
    count(*) as n_records

from "insurance_analytics"."dwh"."fact_policies"
where id_fact_policies is not null
group by id_fact_policies
having count(*) > 1



  
  
      
    ) dbt_internal_test