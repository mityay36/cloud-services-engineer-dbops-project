ALTER TABLE product ADD COLUMN price double precision;

UPDATE product p
SET price = pi.price
FROM product_info pi
WHERE p.id = pi.product_id;

DROP TABLE product_info;

ALTER TABLE orders ADD COLUMN date_created date DEFAULT current_date;

UPDATE orders o
SET date_created = od.date_created
FROM orders_date od
WHERE o.id = od.order_id;

DROP TABLE orders_date;

ALTER TABLE orders ADD PRIMARY KEY (id);
ALTER TABLE product ADD PRIMARY KEY (id);

ALTER TABLE order_product
ADD CONSTRAINT fk_order_product_order_id
FOREIGN KEY (order_id) REFERENCES orders(id);

ALTER TABLE order_product
ADD CONSTRAINT fk_order_product_product_id
FOREIGN KEY (product_id) REFERENCES product(id);
