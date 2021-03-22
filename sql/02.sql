/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

SELECT
    foo.country
    FROM (
        SELECT
            DISTINCT cu.customer_id, co.country
            FROM customer cu
            JOIN address a ON a.address_id = cu.address_id
            JOIN city ci ON ci.city_id = a.city_id
            JOIN country co ON co.country_id = ci.country_id
    ) foo GROUP BY foo.country ORDER BY COUNT(foo.country) DESC
    LIMIT 1
