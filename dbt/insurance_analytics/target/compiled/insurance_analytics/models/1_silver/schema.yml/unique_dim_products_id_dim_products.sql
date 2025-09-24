
    
    

select
    id_dim_products as unique_field,
    count(*) as n_records

from "insurance_analytics"."dwh"."dim_products"
where id_dim_products is not null
group by id_dim_products
having count(*) > 1


