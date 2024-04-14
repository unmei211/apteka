CREATE OR REPLACE PROCEDURE
    addMedicines
    (
        IN medicineName VARCHAR,
        IN manufacturerName VARCHAR,
        IN dosageVar VARCHAR
    )
AS $$
DECLARE
    manufacturerId integer := NULL;
BEGIN
    CALL findManufacturer(manufacturerName, manufacturerId);
    INSERT INTO medicines(name, manufacturer_id, dosage) VALUES(medicineName, manufacturerId, dosageVar);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE
    findManufacturer
    (
        IN manufacturerName varchar,
        OUT manufacturerId integer
    )
AS $$
BEGIN
    SELECT id INTO manufacturerId FROM manufacturer WHERE name = manufacturerName;
    IF manufacturerId IS NULL THEN
        INSERT INTO manufacturer(name) VALUES(manufacturerName);
        manufacturerId = lastval();
    END IF;

    raise notice 'Manufacturer id: %', manufacturerId;
END;
$$ LANGUAGE plpgsql;



call addMedicines('Nurofen 2.0', 'Prozdvoditel', 'odin v den');




