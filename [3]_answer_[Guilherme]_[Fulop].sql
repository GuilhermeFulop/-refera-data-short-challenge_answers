with first_rent as (
	select customer_id, 
			min(extract( month from rental_date)) as visit_1
	from rental
	group by customer_id
)

select visit_1 as entry_customer_month, count(*) as quantity_of_new_customers from first_rent
group by visit_1
order by visit_1


-- first, I created a query to select the first month each client rented;
-- then, I created a query to count the number of new clients per month