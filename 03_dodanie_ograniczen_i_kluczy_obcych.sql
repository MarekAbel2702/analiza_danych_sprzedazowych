ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_products FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_stores FOREIGN KEY (store_id) REFERENCES stores(store_id);

ALTER TABLE orders
ADD CONSTRAINT df_orders_order_date DEFAULT GETDATE() FOR order_date;

ALTER TABLE customers
ADD CONSTRAINT df_customers_signup_date DEFAULT GETDATE() FOR signup_date;

ALTER TABLE stores
ADD CONSTRAINT df_stores_open_date DEFAULT GETDATE() FOR open_date;

ALTER TABLE orders
ALTER COLUMN quantity int NOT NULL;

ALTER TABLE orders
ALTER COLUMN price_per_unit float NOT NULL;

ALTER TABLE orders 
ALTER COLUMN payment_method VARCHAR(50) NOT NULL;

ALTER TABLE customers
ALTER COLUMN gender VARCHAR(50) NOT NULL;

ALTER TABLE customers
ALTER COLUMN age int NOT NULL;

ALTER TABLE products
ALTER COLUMN name VARCHAR(100) NOT NULL;

ALTER TABLE products
ALTER COLUMN category VARCHAR(50) NOT NULL;

ALTER TABLE products
ALTER COLUMN cost_price float NOT NULL;

ALTER TABLE products
ALTER COLUMN list_price float NOT NULL;

ALTER TABLE products
ALTER COLUMN brand VARCHAR(100) NOT NULL;

ALTER TABLE stores
ALTER COLUMN region VARCHAR(100) NOT NULL;

ALTER TABLE stores
ALTER COLUMN city VARCHAR(100) NOT NULL;

ALTER TABLE orders
ADD CONSTRAINT chk_orders_payment_method CHECK (payment_method IN('card', 'cash', 'paypal', 'crypto'));