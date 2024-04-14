CREATE OR REPLACE PROCEDURE
    reportMedicines
    (
        date_from varchar,
        date_to varchar
    )
AS $$
BEGIN
    TRUNCATE TABLE ReportMedicinesTable;
    INSERT INTO ReportMedicinesTable
    SELECT
        m.name AS medicine_name,
        COUNT(ol.amount) AS total_amount,
        SUM(ol.amount * sl.cost_per_piece) AS total_cost,
        COUNT(distinct ol.order_id) AS orders
    FROM medicines m
    JOIN orderlist ol on m.id = ol.medicine_id
    JOIN supplylist sl on m.id = sl.medicine_id
    JOIN orders ord on ol.order_id = ord.id
    WHERE ord.order_date
        BETWEEN
            to_date(date_from, 'YYYY-MM-DD')
            AND
            to_date(date_to, 'YYYY-MM-DD')
    GROUP BY m.name
    ORDER BY total_cost DESC;
END;
$$ LANGUAGE plpgsql;

call reportMedicines('2023-01-01', '2024-01-01');


CREATE TABLE ReportMedicinesTable(
    medicine_name varchar,
    total_amount integer,
    total_cost integer,
    orders integer
);