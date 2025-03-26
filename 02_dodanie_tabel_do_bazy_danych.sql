CREATE TABLE orders (
	order_id INT PRIMARY KEY IDENTITY(1, 1),
	customer_id INT,
	product_id INT,
	quantity INT,
	price_per_unit FLOAT,
	order_date DATE,
	store_id INT,
	discount_percent FLOAT,
	payment_method VARCHAR(50)
);

CREATE TABLE customers (
	customer_id INT PRIMARY KEY IDENTITY(1, 1),
	gender VARCHAR(50),
	age INT,
	city VARCHAR(150),
	signup_date DATE
);

CREATE TABLE products (
	product_id INT PRIMARY KEY IDENTITY(1, 1),
	name VARCHAR(100),
	category VARCHAR(50),
	cost_price FLOAT,
	list_price FLOAT,
	brand VARCHAR(100)
);

CREATE TABLE stores (
	store_id INT PRIMARY KEY IDENTITY(1, 1),
	region VARCHAR(100),
	city VARCHAR(100),
	open_date DATE
);