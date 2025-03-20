/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */

SELECT title
FROM film
JOIN film_actor USING (film_id)
WHERE actor_id IN (
    SELECT actor_id
    FROM film
    JOIN film_actor USING (film_id)
    WHERE film.title IN ('AMERICAN CIRCUS', 'AGENT TRUMAN', 'ACADEMY DINOSAUR')
)
GROUP BY title
HAVING COUNT(actor_id) > 2
ORDER BY title;

