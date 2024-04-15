CREATE ROLE cust_role;
CREATE USER usernikit WITH password 'cisco';

CREATE USER userart WITH password 'cisco';

GRANT cust_role TO usernikit;
GRANT cust_role TO userart;

GRANT CONNECT ON DATABASE apteka TO userart;
GRANT CONNECT ON DATABASE apteka TO usernikit;
DROP POLICY select_data ON orders;
CREATE POLICY select_data ON orders FOR SELECT
    USING (customer_id = (select id
                          FROM customers
                          WHERE name = current_user));
ALTER TABLE orders
    ENABLE row level security;
GRANT SELECT on orders TO cust_role;
GRANT SELECT on orders, customers TO cust_role;

SELECT * FROM orders;

