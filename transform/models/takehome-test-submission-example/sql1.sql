select country_name, sum(gmv_local) as total_gmv  from `1.Orders`
group by country_name;