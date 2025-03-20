/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */

SELECT actor.first_name, actor.last_name
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY actor.actor_id, actor.first_name, actor.last_name
HAVING 
COUNT(CASE WHEN category.name = 'Children' THEN 1 END) > 0
AND 
COUNT(CASE WHEN category.name = 'Horror' THEN 1 END) = 0
ORDER BY actor.last_name, actor.first_name;

