/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */

SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name IN (
    SELECT c2.name
    FROM film f2
    JOIN film_category fc2 ON f2.film_id = fc2.film_id
    JOIN category c2 ON fc2.category_id = c2.category_id
    WHERE f2.title = 'AMERICAN CIRCUS'
)
  AND EXISTS (
    SELECT 1
    FROM film_actor fa
    WHERE fa.film_id = f.film_id
      AND fa.actor_id IN (
          SELECT fa2.actor_id
          FROM film_actor fa2
          JOIN film f3 ON fa2.film_id = f3.film_id
          WHERE f3.title = 'AMERICAN CIRCUS'
      )
  )
GROUP BY f.title
HAVING COUNT(DISTINCT c.name) >= 2
ORDER BY f.title ASC;

