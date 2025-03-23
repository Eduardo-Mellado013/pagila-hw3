/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */
SELECT f2.title
FROM film_actor AS fa1
JOIN film_actor AS fa2 ON fa1.actor_id = fa2.actor_id
JOIN film AS f1 ON fa1.film_id = f1.film_id
JOIN film AS f2 ON fa2.film_id = f2.film_id
WHERE f1.title IN ('AMERICAN CIRCUS', 'AGENT TRUMAN', 'ACADEMY DINOSAUR')
GROUP BY f2.title
HAVING COUNT(fa2.actor_id) >= 3
ORDER BY f2.title;

