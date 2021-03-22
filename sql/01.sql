/*
 * Write a SQL query SELECT query that:
 * computes the number of customers who live outside of the US.
 */

SELECT
    COUNT(*) 
    FROM (
        SELECT
            DISTINCT customer_id
            FROM customer cu
            JOIN address a ON a.address_id = cu.address_id
            JOIN city ci ON ci.city_id = a.city_id
            JOIN country co ON co.country_id = ci.country_id
            WHERE co.country != 'United States'
    ) foo
