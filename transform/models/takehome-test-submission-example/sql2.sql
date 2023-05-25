select vr.vendor_name, count(ord.customer_id) as customer_count, sum(ord.gmv_local) as total_gmv  from `1.Orders` as ord
left join `1.Vendors` as vr 
on ord.vendor_id = vr.id
group by vr.vendor_name
order by customer_count desc;