/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */

SELECT film.title
FROM film
JOIN film_actor USING (film_id)
WHERE film_actor.actor_id IN (
    SELECT film_actor.actor_id
    FROM film_actor
    JOIN film USING (film_id)
    WHERE film.title = 'AMERICAN CIRCUS'
)
GROUP BY film.title
HAVING COUNT(actor_id) >= 2
ORDER BY title ASC;

