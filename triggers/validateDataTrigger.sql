create or replace function validate_date()
    returns trigger as $$
    begin
        if new.delivery_date is null then
            new.delivery_date := current_date + interval '5 days';
        end if;
        return new;
    end
    $$ language plpgsql;

create or replace trigger validate_data_trigger
    before insert on orders
    for each row
    execute procedure validate_date();

INSERT INTO Orders(customer_id, order_date, delivery_date, delivery_address)
    VALUES
    (
        5,
        to_date('22-02-2023', 'DD-MM-YYYY'),
        null,
        'melnichnya 11'
    );