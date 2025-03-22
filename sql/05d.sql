/* 
 * In the previous query, the actors could come from any combination of movies.
 * Unfortunately, you've found that if the actors all come from only 1 or 2 of the movies,
 * then there is not enough diversity in the acting talent.
 *
 * Write a SQL query that lists all of the movies where:
 * at least 1 actor was also in AMERICAN CIRCUS,
 * at least 1 actor was also in ACADEMY DINOSAUR,
 * and at least 1 actor was also in AGENT TRUMAN.
 *
 * HINT:
 * There are many ways to solve this problem,
 * but I personally found the INTERSECT operator to make a convenient solution.
 */

SELECT DISTINCT f.title
FROM film f
JOIN film_actor fa_ac ON f.film_id = fa_ac.film_id
JOIN film_actor fa_ad ON f.film_id = fa_ad.film_id
JOIN film_actor fa_at ON f.film_id = fa_at.film_id
WHERE fa_ac.actor_id IN (
    SELECT actor_id
    FROM film
    JOIN film_actor USING (film_id)
    WHERE title = 'AMERICAN CIRCUS'
)
  AND fa_ad.actor_id IN (
    SELECT actor_id
    FROM film
    JOIN film_actor USING (film_id)
    WHERE title = 'ACADEMY DINOSAUR'
)
  AND fa_at.actor_id IN (
    SELECT actor_id
    FROM film
    JOIN film_actor USING (film_id)
    WHERE title = 'AGENT TRUMAN'
)
ORDER BY f.title;

