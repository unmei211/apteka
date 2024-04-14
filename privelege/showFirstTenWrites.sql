-- 2 дать право админу(нового пользователя) считать первые 10 записей из таблицы состав поставки с 8:00 12:00 утра

CREATE ROLE myadmin_role;

CREATE USER myadmin_user WITH PASSWORD 'cisco';
GRANT myadmin_role TO myadmin_user;

GRANT CONNECT ON DATABASE apteka TO myadmin_user;

CREATE OR REPLACE VIEW limited_supply_view AS
SELECT *
FROM supplylist
WHERE EXTRACT(HOUR FROM current_time) >= 5
  AND EXTRACT(HOUR FROM current_time) < 12
LIMIT 10;
select * from limited_supply_view;

select * from current_time;

GRANT SELECT ON limited_supply_view TO myadmin_role;


drop view  limited_supply_view;

select * from limited_supply_view;




