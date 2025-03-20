/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
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
ORDER BY title ASC;
