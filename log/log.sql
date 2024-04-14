CREATE TABLE medicines_deleted
(
    id                INTEGER,
    name              VARCHAR,
    manufacturer_id   integer,
    deleted_time      date,
    database_username varchar
);

CREATE OR REPLACE FUNCTION copy_deleted_medicine()
    RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO medicines_deleted (id, name, manufacturer_id, deleted_time, database_username)
    VALUES (OLD.id, OLD.name, OLD.manufacturer_id, current_date, current_user);
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_copy_deleted_medicine
    AFTER DELETE
    ON medicines
    FOR EACH ROW
EXECUTE FUNCTION copy_deleted_medicine();

INSERT INTO medicines(name, manufacturer_id, dosage)
VALUES ('test_medicine', 1, 'ne znayu');
DELETE
FROM medicines
WHERE name = 'test_medicine';



CREATE TABLE medicines_audit
(
    operation_type      VARCHAR,
    operation_count     INTEGER DEFAULT 0,
    operation_last_date date,
    operation_prev_date date
);



INSERT INTO medicines_audit
VALUES ('INSERT',
        0,
        null,
        null);
INSERT INTO medicines_audit
VALUES ('UPDATE',
        0,
        null,
        null);
INSERT INTO medicines_audit
VALUES ('DELETE',
        0,
        null,
        null);

CREATE OR REPLACE FUNCTION update_audit_count()
    RETURNS TRIGGER AS
$$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE medicines_audit
        SET operation_count     = operation_count + 1,
            operation_prev_date = operation_last_date,
            operation_last_date = current_date
        WHERE operation_type = 'INSERT';
    ELSIF TG_OP = 'DELETE' THEN
        UPDATE medicines_audit
        SET operation_count     = operation_count + 1,
            operation_prev_date = operation_last_date,
            operation_last_date = current_date
        WHERE operation_type = 'DELETE';
    ELSIF TG_OP = 'UPDATE' THEN
        UPDATE medicines_audit
        SET operation_count     = operation_count + 1,
            operation_prev_date = operation_last_date,
            operation_last_date = current_date
        WHERE operation_type = 'UPDATE';
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_audit_count
    AFTER DELETE OR INSERT OR UPDATE
    ON medicines
    FOR EACH STATEMENT
EXECUTE FUNCTION update_audit_count();

