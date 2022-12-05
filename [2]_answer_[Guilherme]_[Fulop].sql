
with most_16_rented as (SELECT
						f.film_id,
						count(r.rental_id) as Quantity

						from rental as r
						left join inventory as inv
						on inv.inventory_id = r.inventory_id
						left join film as f
						on f.film_id = inv.film_id
						group by f.film_id
						order by Quantity desc
						limit 16),

actor_quantity as (select concat (ac.first_name, ' ',ac.last_name) as Actor_name, count(*) as cnt

					from most_16_rented
					left join film_actor as fa
					on most_16_rented.film_id = fa.film_id
					left join actor as ac
					on ac.actor_id = fa.actor_id
					group by Actor_name
					order by cnt DESC
					limit 1)

select Actor_name from actor_quantity


-- I used almost the same query from the question 1 to get the 16 most rented movies, but instead of getting
-- the movie title, I choose to get the film_id, and I called it 'most_16_rented';
-- then, I created the query 'actor_quantity' and conected with the table 'most_16_rented'
-- for last, calling Actor_name from actor_quantity show the most present actor in the first 16 movies