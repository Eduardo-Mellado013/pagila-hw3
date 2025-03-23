/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */
SELECT customer.customer_id, customer.first_name, customer.last_name
FROM customer
JOIN LATERAL (
    SELECT rental_date, title, film_id, category.name AS category_name
    FROM rental
    JOIN inventory USING (inventory_id)
    JOIN film USING (film_id)
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    WHERE rental.customer_id = customer.customer_id
    ORDER BY rental_date DESC
    LIMIT 5
) AS latest ON true
GROUP BY customer.customer_id, customer.first_name, customer.last_name
HAVING COUNT(*) FILTER (WHERE latest.category_name = 'Action') >= 3
ORDER BY customer.customer_id;

