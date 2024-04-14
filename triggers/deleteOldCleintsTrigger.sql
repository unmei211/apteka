CREATE OR REPLACE FUNCTION delete_old_clients()
RETURNS TRIGGER AS $$
BEGIN
  DELETE FROM Customers
  WHERE id IN (
    SELECT c.id
    FROM Customers c
    WHERE NOT EXISTS (
      SELECT 1
      FROM Orders o
      WHERE o.customer_id = c.id
      AND order_date > CURRENT_DATE - INTERVAL '5 day'
    )
  );
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER delete_old_clients_trigger
AFTER INSERT ON Orders
EXECUTE FUNCTION delete_old_clients();

select * from customers;


INSERT INTO Orders(customer_id, order_date, delivery_date, delivery_address)
    VALUES
    (
        5,
        current_date,
        null,
        'melnichnya 11'
    );
