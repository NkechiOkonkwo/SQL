CREATE TABLE order_details ( 
	order_details_id INT PRIMARY KEY NOT NULL,
	order_id INT NOT NULL,
	pizza_id INT NOT NULL,
	quantity INT NOT NULL
);

CREATE TABLE orders ( 
	order_id INT PRIMARY KEY NOT NULL,
	date DATE NOT NULL,
	time TIME NOT NULL
);

CREATE TABLE pizza_types ( 
	pizza_type_id VARCHAR PRIMARY KEY NOT NULL,
	name VARCHAR (300) NOT NULL,
	category VARCHAR (300) NOT NULL,
	ingredients VARCHAR (300) NOT NULL
);

CREATE TABLE pizzas ( 
	pizza_id VARCHAR PRIMARY KEY NOT NULL,
	pizza_type_id VARCHAR NOT NULL,
	size VARCHAR NOT NULL,
	price REAL NOT NULL
);
