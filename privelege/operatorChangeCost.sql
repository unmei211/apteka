-- дать право оператору изменять стоимость на меньшую и препаратов если срок годности выходит через 2 месяца

-- сделал, что цена уменьшается у товаров, чья поставка более года назад
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

CREATE ROLE operator_role;
CREATE USER operator_user WITH PASSWORD 'cisco';
GRANT operator_role TO operator_user;

GRANT CONNECT ON DATABASE apteka TO operator_user;

GRANT EXECUTE ON PROCEDURE decrease_cost_if_old TO operator_role;
DROP PROCEDURE decrease_cost_if_old;

call decrease_cost_if_old();