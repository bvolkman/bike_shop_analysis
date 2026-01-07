-- To create the Bike Shop database and tables. Data was imported on csv files for each of the tables below.

CREATE SCHEMA sales;

CREATE SCHEMA production;

CREATE TABLE production.brands (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(50)
);

CREATE TABLE production.categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE production.products (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    brand_id INTEGER,
    category_id INTEGER,
    model_year INTEGER,
    list_price DECIMAL(8,2),
    FOREIGN KEY (brand_id) REFERENCES production.brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES production.categories(category_id)
    );

CREATE TABLE sales.customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(14),
    email VARCHAR,
    street VARCHAR,
    city VARCHAR(50),
    state CHAR(2),
    zip_code CHAR(5)
);

CREATE TABLE sales.stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(50),
    phone VARCHAR(14),
    email VARCHAR,
    street VARCHAR,
    city VARCHAR(50),
    state CHAR(2),
    zip_code CHAR(5)
);

CREATE TABLE production.stocks (
    store_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES sales.stores(store_id),
    FOREIGN KEY (product_id) REFERENCES production.products(product_id)
);

CREATE TABLE sales.staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR,
    phone VARCHAR(14),
    active INTEGER,
    store_id INTEGER,
    manager_id INTEGER,
    FOREIGN KEY (store_id) REFERENCES sales.stores(store_id),
    FOREIGN KEY (manager_id) REFERENCES sales.staff(staff_id)
); 

CREATE TABLE sales.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    order_status INTEGER,
    order_date TIMESTAMPTZ,
    required_date TIMESTAMPTZ,
    shipped_date TIMESTAMPTZ,
    store_id INTEGER,
    staff_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES sales.customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES sales.stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES sales.staff(staff_id)
);

CREATE TABLE sales.order_items (
    order_id INTEGER,
    item_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    list_price DECIMAL(8,2),
    discount DECIMAL(2,2),
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES sales.orders(order_id),
    FOREIGN KEY (product_id) REFERENCES production.products(product_id)
);
