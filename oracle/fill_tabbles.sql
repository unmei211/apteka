-- CUSTOMERS ADD START
INSERT INTO CUSTOMERS VALUES (
    1,
    'Vladislav',
    'Starovoytov',
    'Alekseevich',
    '7777777777'
);
INSERT INTO CUSTOMERS VALUES (
    2,
    'Artem',
    'Potapov',
    'Vitalyevich',
    '8777777777'
);
INSERT INTO CUSTOMERS VALUES (
    3,
    'Anastasia',
    'Dolinina',
    'Dmitrievna',
    '2777777772'
);
INSERT INTO CUSTOMERS VALUES (
    4,
    'Nikita',
    'Fendel',
    'Sergeevich',
    '3777777772'
);
INSERT INTO CUSTOMERS VALUES (
    5,
    'Nikita',
    'Zhokov',
    'Cheytovich',
    '1777777772'
);
-- CUSTOMERS ADD END

-- SUPPLIERS ADD START
INSERT INTO SUPPLIERS VALUES(1, 'OOO Postavka');
INSERT INTO SUPPLIERS VALUES(2, 'Postavkin');
INSERT INTO SUPPLIERS VALUES(3, 'Elte');
INSERT INTO SUPPLIERS VALUES(4, 'Severnaya Zvezda');
-- SUPPLIERS ADD END

-- MEDICINES ADD START
INSERT INTO MEDICINES VALUES(1, 'activity ugol');
INSERT INTO MEDICINES VALUES(2, 'askofen');
INSERT INTO MEDICINES VALUES(3, 'pepedol');
INSERT INTO MEDICINES VALUES(4, 'perekis');
-- MEDICINES ADD END

-- ORDERS ADD START
INSERT INTO ORDERS VALUES(1,5, TO_DATE('20-03-2022', 'DD-MM-YYYY'), TO_DATE('22-03-2022', 'DD-MM-YYYY'), 'melnichnya 11');
INSERT INTO ORDERS VALUES(2,4, TO_DATE('05-04-2022', 'DD-MM-YYYY'), TO_DATE('09-04-2022', 'DD-MM-YYYY'), 'melnichnya 15');
INSERT INTO ORDERS VALUES(3,3, TO_DATE('02-05-2022', 'DD-MM-YYYY'), TO_DATE('10-05-2022', 'DD-MM-YYYY'), 'kazanceva 1');
INSERT INTO ORDERS VALUES(4,2, TO_DATE('21-03-2022', 'DD-MM-YYYY'), TO_DATE('27-03-2022', 'DD-MM-YYYY'), 'stepanza 9');
INSERT INTO ORDERS VALUES(5,1, TO_DATE('20-03-2022', 'DD-MM-YYYY'), TO_DATE('22-03-2022', 'DD-MM-YYYY'), 'aviacionnaya 6');
INSERT INTO ORDERS VALUES(6,5, TO_DATE('14-03-2022', 'DD-MM-YYYY'), TO_DATE('22-03-2022', 'DD-MM-YYYY'), 'melnichnya 2');
INSERT INTO ORDERS VALUES(7,5, TO_DATE('24-10-2023', 'DD-MM-YYYY'), NULL, 'melnichnaya 2');
INSERT INTO ORDERS VALUES(8,4, TO_DATE('23-10-2023', 'DD-MM-YYYY'), NULL, 'melnichnaya 15');
-- ORDERS ADD END

-- STORAGES ADD START
INSERT INTO STORAGES VALUES(1, 'farmokopeyka', '1111111111', 'centralnaya 2');
INSERT INTO STORAGES VALUES(2, 'farmokopeyka', '2222222222', 'profinterna 1a');
INSERT INTO STORAGES VALUES(3, 'sklad 1', '333333333','revoluzionnaya 8');
INSERT INTO STORAGES VALUES(4, 'sklad 2', '12121212', 'reznikova 2');
-- STORAGES ADD END

-- SUPPLY start
INSERT INTO SUPPLY VALUES (1,1, TO_DATE('11-02-2021', 'DD-MM-YYYY'), 1);
INSERT INTO SUPPLY VALUES (2,2, TO_DATE('13-02-2021', 'DD-MM-YYYY'), 2);
INSERT INTO SUPPLY VALUES (3,3, TO_DATE('15-03-2021', 'DD-MM-YYYY'), 3);
INSERT INTO SUPPLY VALUES (4,4, TO_DATE('11-02-2021', 'DD-MM-YYYY'), 4);
-- SUPPLY end

-- SUPPLYLIST start
INSERT INTO SUPPLYLIST VALUES (1, 1, 1, 30, 200);
INSERT INTO SUPPLYLIST VALUES (2, 1, 2,40, 300);
INSERT INTO SUPPLYLIST VALUES (3, 2, 1,40, 300);
INSERT INTO SUPPLYLIST VALUES (4, 3, 3,50, 100);
INSERT INTO SUPPLYLIST VALUES (5, 4, 4,30, 200);
-- SUPPLYLIST end

-- ORDERLIST start
INSERT INTO ORDERLIST VALUES (1, 1, 1, 2);
INSERT INTO ORDERLIST VALUES (1, 2, 2, 3);
INSERT INTO ORDERLIST VALUES (2, 3, 2, 1);
INSERT INTO ORDERLIST VALUES (2, 3, 1, 2);
INSERT INTO ORDERLIST VALUES (3, 5, 4, 2);
INSERT INTO ORDERLIST VALUES (4, 2, 1, 3);
INSERT INTO ORDERLIST VALUES (7, 3, 2, 1);
INSERT INTO ORDERLIST VALUES (8, 4, 3, 1);
-- ORDERLIST end