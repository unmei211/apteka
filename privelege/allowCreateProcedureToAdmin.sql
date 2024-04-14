
-- 5 дать право админу создавать процедуры
CREATE OR REPLACE FUNCTION check_admin_create_function()
RETURNS event_trigger AS $$
BEGIN
    IF current_user = 'myadmin_user' AND tg_tag = 'CREATE PROCEDURE' THEN
        RAISE NOTICE 'Creating procedure by admin is allowed';
    ELSIF current_user = 'myadmin_user' AND tg_tag != 'CREATE PROCEDURE' THEN
        RAISE EXCEPTION 'Only creation of procedures is allowed for admin';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER allow_admin_create_procedures_trigger
ON ddl_command_start
WHEN TAG IN ('CREATE PROCEDURE')
EXECUTE FUNCTION check_admin_create_function();

GRANT CREATE ON SCHEMA public TO myadmin_role;

CREATE OR REPLACE PROCEDURE decrease_cost_if_old()
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
    supply_id_val INTEGER;
BEGIN
    FOR supply_id_val IN
        SELECT sl.supply_id
        FROM SupplyList sl
        JOIN Supply s ON sl.supply_id = s.id
        WHERE s.supply_date < current_date - INTERVAL '10 year'
    LOOP
        UPDATE SupplyList
        SET cost_per_piece = cost_per_piece * 0.9
        WHERE supply_id = supply_id_val;
    END LOOP;
END;
$$;



