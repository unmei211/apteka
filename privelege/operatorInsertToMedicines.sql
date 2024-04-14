-- 4 дать право опреатору добавлять лекарства с проверкой что лекарство с БОЛЬШОЙ БУКВЫ

CREATE OR REPLACE RULE capitalize_medicine_name_rule AS
ON INSERT TO Medicines
WHERE NEW.name <> INITCAP(NEW.name) AND current_user = 'operator_user'
DO INSTEAD NOTHING;


GRANT INSERT ON medicines to operator_role;

insert into medicines(name, manufacturer_id, dosage) values ('Lololo', 1, 1);