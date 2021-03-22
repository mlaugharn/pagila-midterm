/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 *
 * HINT:
 * This requires joining from the category table down to the actor table.
 */

SELECT
    DISTINCT first_name || ' ' || last_name as "Actor Name"
    FROM actor a
    JOIN film_actor fa ON (a.actor_id = fa.actor_id)
    JOIN film f ON (f.film_id = fa.film_id)
    JOIN film_category fc ON (fc.film_id = f.film_id)
    JOIN category c ON (c.category_id = fc.category_id)
    WHERE name = 'Children'
    AND first_name || ' ' || last_name  NOT IN (
        SELECT first_name || ' ' || last_name as "Actor Name"
        FROM actor a
        JOIN film_actor fa ON (a.actor_id = fa.actor_id)
        JOIN film f ON (f.film_id = fa.film_id)
        JOIN film_category fc ON (fc.film_id = f.film_id)
        JOIN category c ON (c.category_id = fc.category_id)
        WHERE name = 'Horror')
    ORDER BY "Actor Name"
