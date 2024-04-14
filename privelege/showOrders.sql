-- 1 дать право заказчикам смотреть данные о заказах которые они заказывали

CREATE ROLE customer_role;
CREATE USER usernikita WITH password 'cisco';

CREATE USER userartem WITH PASSWORD 'cisco';
GRANT customer_role TO usernikita;

GRANT CONNECT ON DATABASE apteka TO usernikita;


CREATE VIEW order_info_view AS
SELECT
    o.id AS order_id,
    o.customer_id,
    o.order_date,
    o.delivery_date,
    o.delivery_address,
    ol.medicine_id,
    ol.amount
FROM Orders o
JOIN OrderList ol ON o.id = ol.order_id
WHERE o.customer_id = (SELECT id FROM Customers WHERE name = current_user);

GRANT SELECT ON order_info_view TO customer_role;

SELECT * FROM order_info_view;

