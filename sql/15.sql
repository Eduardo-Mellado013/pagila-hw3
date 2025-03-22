/*
 * Find every documentary film that is rated G.
 * Report the title and the actors.
 *
 * HINT:
 * Getting the formatting right on this query can be tricky.
 * You are welcome to try to manually get the correct formatting.
 * But there is also a view in the database that contains the correct formatting,
 * and you can SELECT from that VIEW instead of constructing the entire query manually.
 */

SELECT film.title,
       STRING_AGG(
         upper(substring(actor.first_name from 1 for 1)) || lower(substring(actor.first_name from 2)) ||
         upper(substring(actor.last_name from 1 for 1)) || lower(substring(actor.last_name from 2)),
         ', '
       ) AS actors
FROM film
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE film.rating = 'G'
  AND category.name = 'Documentary'
GROUP BY film.title;

