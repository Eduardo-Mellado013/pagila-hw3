/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM film
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
WHERE film_id IN (
    SELECT film_id
    FROM film
    JOIN film_actor USING (film_id)
    WHERE actor_id IN (
        SELECT DISTINCT actor_id
        FROM film
        JOIN film_actor USING (film_id)
        JOIN actor USING (actor_id)
        WHERE film_id IN (
            SELECT film_id
            FROM film
            JOIN film_actor USING (film_id)
            JOIN actor USING (actor_id)
            WHERE first_name = 'RUSSELL'
              AND last_name = 'BACALL'
        )
        AND NOT (first_name = 'RUSSELL' AND last_name = 'BACALL')
    )
)
AND actor_id NOT IN (
    SELECT DISTINCT actor_id
    FROM film
    JOIN film_actor USING (film_id)
    JOIN actor USING (actor_id)
    WHERE film_id IN (
        SELECT film_id
        FROM film
        JOIN film_actor USING (film_id)
        JOIN actor USING (actor_id)
        WHERE first_name = 'RUSSELL'
          AND last_name = 'BACALL'
    )
    AND NOT (first_name = 'RUSSELL' AND last_name = 'BACALL')
)
AND NOT (first_name = 'RUSSELL' AND last_name = 'BACALL')
ORDER BY "Actor Name" ASC;

