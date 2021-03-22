/*
 * Reorder the columns in the following SQL table so that the resulting table minimizes disk usage.
 * You do not need to compute the total disk usage per row.
 */

CREATE TABLE project (
    created_at TIMESTAMPTZ, -- typlen 8 align 8
    updated_at TIMESTAMPTZ, -- typlen 8 align 8
    author_id BIGINT NOT NULL, -- typlen 8 align 8
    id SERIAL PRIMARY KEY, -- typlen 4 align 4
    target_id INTEGER NOT NULL, -- typlen 4 align 4
    project_id INTEGER NOT NULL UNIQUE, -- typlen 4 align 4
    action SMALLINT NOT NULL, -- typlen 2 align 2
    target_type VARCHAR(2) NOT NULL, -- typlen -1 align 4
    title VARCHAR(256), -- typlen -1 align 4
    data TEXT -- typlen -1 align 4
);
