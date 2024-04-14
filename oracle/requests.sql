--SELCET  (SELECT * FROM ORDERS WHERE TO_TIMESTAMP(delivery_date) >= sysdate - INTERVAL 2 DAY;)

SELECT NAME FROM MEDICINES, ORDERLIST, ORDERS 
    WHERE MEDICINES.ID = ORDERLIST.order_id
        AND ORDERS.ID = ORDERLIST.order_id
            AND ORDERS.order_date BETWEEN(sysdate - 453542)  and sysdate
        