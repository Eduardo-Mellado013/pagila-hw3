/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */

SELECT name, title, "total rentals"
FROM (
    SELECT category.name AS name,
           film.title AS title,
           COUNT(rental.rental_id) AS "total rentals",
           RANK() OVER (
               PARTITION BY category.name
               ORDER BY COUNT(rental.rental_id) DESC, film.title DESC
           ) AS rank
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    GROUP BY category.name, film.film_id, film.title
) AS sub
WHERE rank <= 5
ORDER BY name, "total rentals" DESC, title;

