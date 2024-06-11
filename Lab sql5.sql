ALTER TABLE staff DROP COLUMN picture;
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date)
VALUES (
    1, -- Assuming she belongs to store 1
    'TAMMY',
    'SANDERS',
    'tammy.sanders@example.com', -- Placeholder email
    (SELECT address_id FROM address ORDER BY address_id DESC LIMIT 1), -- Using the latest address
    1, -- Assuming she is active
    CURDATE()
);
INSERT INTO deleted_users (customer_id, email, deletion_date)
SELECT customer_id, email, CURDATE() FROM customer WHERE active = 0;
DELETE FROM customer WHERE active = 0;
