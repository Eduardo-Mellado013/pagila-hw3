/* For each customer, find the movie that they have rented most recently.
 *
 * NOTE:
 * This problem can be solved with either a subquery (using techniques we've covered in class),
 * or a new type of join called a LATERAL JOIN.
 * You are not required to use LATERAL JOINs,
 * and we will not cover in class how to use them.
 * Nevertheless, they can greatly simplify your code,
 * and so I recommend that you learn to use them.
 * The website <https://linuxhint.com/postgres-lateral-join/> provides a LATERAL JOIN that solves this problem.
 * All of the subsequent problems in this homework can be solved with LATERAL JOINs
 * (or slightly less conveniently with subqueries).
 */

SELECT first_name, last_name, title, rental_date
FROM customer
JOIN LATERAL (
    SELECT rental_date, title
    FROM rental
    JOIN inventory USING (inventory_id)
    JOIN film USING (film_id)
    WHERE rental.customer_id = customer.customer_id
    ORDER BY rental_date DESC
    LIMIT 1
) AS latest ON true
ORDER BY last_name, first_name;

