-- «¿ ¿«◊» »
CREATE TABLE CUSTOMERS (
    id number(8),
    name varchar(20) not null,
    surname varchar(20) not null,
    patronymic varchar(20),
    phone_number varchar(10) not null,
    
    CONSTRAINT PR_KEY_CUSTOMERS_ID primary key (id)
);

-- œŒ—“¿¬Ÿ» » 
CREATE TABLE SUPPLIERS (
    id number(8),
    name varchar(20) not null,
    
    CONSTRAINT PR_KEY_SUPPLIERS_ID primary key (id)
);

-- œ–≈œ¿–¿“€ 
CREATE TABLE MEDICINES (
    id number(8),
    name varchar(20) not null,
    
    CONSTRAINT PR_KEY_MEDICINES_ID primary key (id)
);

-- «¿ ¿«€ 
CREATE TABLE ORDERS (
    id number(8),
    customer_id number (8),
    order_date date not null,
    delivery_date date not null,
    delivery_address varchar(30) not null,
    
    CONSTRAINT PR_KEY_ORDERS_ID primary key(id),
    CONSTRAINT PR_KEY_ORDERS_CUSTOMERS_ID foreign key(customer_id) references CUSTOMERS(id)
);

-- Ã≈—“¿ ’–¿Õ≈Õ»ﬂ
CREATE TABLE STORAGES (
    id number(8),
    name varchar(20) not null,
    phone varchar(10) not null,
    address varchar(30) not null,
    
    CONSTRAINT PR_KEY_STORAGES_ID primary key(id)
);

-- œŒ—“¿¬ » 
CREATE TABLE SUPPLY (
    id number(8),
    supplier_id number(8),
    supply_date date not null,
    storage_id number(8),
    
    CONSTRAINT PR_KEY_SUPPLY_ID primary key(id),
    CONSTRAINT PR_KEY_SUPPLY_SUPPLIERS_ID foreign key (supplier_id) references SUPPLIERS(id),
    CONSTRAINT PR_KEY_SUPPLY_STORAGES_ID foreign key (storage_id) references STORAGES(id)
);


-- —Œ—“¿¬ œŒ—“¿¬ » 
CREATE TABLE SUPPLYLIST (
    id number(8),
    medicine_id number(8),
    supply_id number (8),
    amount number(8),
    cost_per_piece number(8),
    
    CONSTRAINT PR_KEY_SUPPLYLIST_ID primary key (id),
    CONSTRAINT PR_KEY_SUPPLYLIST_SUPPLY_ID foreign key (supply_id) references SUPPLY(id),
    CONSTRAINT PR_KEY_SUPPLYLIST_MEDICINE_ID foreign key (medicine_id) references MEDICINES(id)
);

-- —Œ—“¿¬ «¿ ¿«¿
CREATE TABLE ORDERLIST (
    order_id number(8),
    supplylist_id number(8),
    medicine_id number(8),
    amount number(8),
    
    CONSTRAINT PR_KEY_ORDERLIST_ORDERS_ID foreign key (order_id) references ORDERS(id),
    CONSTRAINT PR_KEY_ORDERLIST_SUPPLY_ID foreign key (supplylist_id) references SUPPLYLIST(id),
    CONSTRAINT PR_KEY_ORDERLIST_MEDICINES_ID foreign key (medicine_id) references MEDICINES(id)
);