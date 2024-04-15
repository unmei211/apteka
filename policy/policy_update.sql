CREATE ROLE supp_role;
CREATE USER supcheck WITH password 'cisco';

GRANT supp_role TO supcheck;

GRANT CONNECT ON DATABASE apteka TO supcheck;


CREATE POLICY supply_update ON supply
    FOR UPDATE
    USING (supplier_id = (SELECT id
                          FROM suppliers
                          WHERE name = current_user)
    );

ALTER TABLE supply
    ENABLE row level security;
GRANT SELECT on supply, suppliers TO supp_role;
GRANT UPDATE on supply, suppliers TO supp_role;

UPDATE supply SET storage_id = 1;
