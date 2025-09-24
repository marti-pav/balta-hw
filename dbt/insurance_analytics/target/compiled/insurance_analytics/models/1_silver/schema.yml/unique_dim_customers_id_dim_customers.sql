
    
    

select
    id_dim_customers as unique_field,
    count(*) as n_records

from "insurance_analytics"."dwh"."dim_customers"
where id_dim_customers is not null
group by id_dim_customers
having count(*) > 1


