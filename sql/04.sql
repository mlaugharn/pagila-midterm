/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */

SELECT
    f.title
    FROM film f 
    JOIN film_actor fa ON fa.film_id = f.film_id
    JOIN actor a ON a.actor_id = fa.actor_id
    WHERE fa.actor_id in (
        SELECT -- American Circus actors
            fa.actor_id
            FROM actor a
            JOIN film_actor fa ON a.actor_id = fa.actor_id
            JOIN film f ON f.film_id = fa.film_id
            WHERE f.title ilike 'AMERICAN CIRCUS'
        )
    GROUP BY (f.title)
    HAVING COUNT(f.title) >= 2
    ORDER BY f.title
