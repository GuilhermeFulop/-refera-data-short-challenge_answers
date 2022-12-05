
SELECT
	f.title as "Movie Title",
	count(r.rental_id) as Quantity

from rental as r
left join inventory as inv
on inv.inventory_id = r.inventory_id
left join film as f
on f.film_id = inv.film_id
group by f.title
order by Quantity desc
limit 2

-- I started choosing the column with the rent information of the dataset (rental table);
-- then I joined it with with the film table, linking them by the invetory id;
-- last, I joined with the film table and linked on film_id
-- so, I was able to get the title of the movie with the rent information of it, but as it wasn't possible 
-- to do directly, I had to use the inventory table.
-- last, I took the title of the movie and counted how many times it appeared in the table
-- grouped by title and orded by quantity and limited the exit by two to get the top 2 most rented movies.