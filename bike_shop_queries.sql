--Source for this project was from user rebekah999. I followed some of their original queries and then performed some of my own.

-- Query 1: Calculates how long it took for each order to ship

SELECT
	order_id,
	EXTRACT(DAY FROM (shipped_date - order_date)) as days_to_ship
FROM sales.orders;

-- Query 2: Calculates the amount of revenue generated from the Santa Cruz Bikes store

WITH order_totals AS (
	SELECT
		ot.order_id,
		ROUND(SUM(ot.quantity * (ot.list_price - (ot.list_price * ot.discount))), 2) AS order_total,
		o.store_id
	FROM sales.order_items ot
	JOIN sales.orders o 
    ON o.order_id = ot.order_id
	GROUP BY ot.order_id, o.store_id
)
SELECT
	st.store_name,
	SUM(ot.order_total) AS store_revenue
FROM order_totals ot
JOIN sales.stores st 
    ON ot.store_id = st.store_id
WHERE st.store_name = 'Santa Cruz Bikes'
GROUP BY st.store_name;

-- Query 3: Calculates the order total for each order id

SELECT
	order_id,
	ROUND(SUM(quantity * (list_price - (list_price * discount))), 2) AS order_total
FROM sales.order_items
GROUP BY order_id
ORDER BY order_id;

-- Query 4: Counts the number of orders placed at each store

SELECT 
	store_id,
	COUNT(DISTINCT order_id) AS orders_count
FROM sales.orders
GROUP BY store_id
ORDER BY store_id;

-- Query 5: Finds all of the customers with a phone number in the database

SELECT
	*
FROM sales.customers
WHERE phone != 'null'; --How the data was imported did not allow the IS NOT NULL statement to work properly, it still produced null results.

-- Query 6: Finds the number of items in each order

SELECT 
	order_id,
	SUM(quantity) AS total_items
FROM sales.order_items
GROUP BY order_id
ORDER BY order_id;

-- Query 7: How much each customer spent across all of their orders

WITH order_totals AS (
	SELECT
		order_id,
		ROUND(SUM(quantity * (list_price - (list_price * discount))), 2) AS order_total
	FROM sales.order_items
	GROUP BY order_id
)
SELECT 
	o.customer_id,
	SUM(ot.order_total) AS total_purchases
FROM sales.orders o
JOIN order_totals ot 
  ON ot.order_id = o.order_id
GROUP BY customer_id
ORDER BY customer_id;

-- Query 8: List of available inventory across all stores
-- Alternate question: Which stores currently carry the product "Trek Kickster - 2018" and how many are in stock?

SELECT 
	sk.store_id,
	sr.store_name,
	sk.product_id,
	p.product_name,
	sk.quantity
FROM production.stocks sk
JOIN production.products p 
  ON p.product_id = sk.product_id 
JOIN sales.stores sr 
  ON sr.store_id = sk.store_id 
WHERE p.product_id = (
	SELECT product_id
	FROM production.products
	WHERE product_name = 'Trek Kickster - 2018'
	);


-- Query 9: Number of sales and total revenue each year

WITH order_totals AS (
    SELECT
        o.order_id,
        DATE_PART('year', o.order_date) AS sales_year,
        SUM(oi.quantity * (oi.list_price - (oi.list_price * oi.discount))) AS order_revenue
    FROM sales.orders o
    JOIN sales.order_items oi 
      ON oi.order_id = o.order_id
    GROUP BY o.order_id, sales_year
)
SELECT
    sales_year,
    COUNT(order_id) AS sales_count,
    ROUND(SUM(order_revenue), 0) AS sales_revenue
FROM order_totals
GROUP BY sales_year
ORDER BY sales_year;

-- Query 10: Number of sales per employee

SELECT 
	s.store_id,
	CONCAT(s.first_name, ' ', s.last_name) AS employee,
	COUNT(o.staff_id) AS orders_sold
FROM sales.orders o
JOIN sales.staff s 
  ON s.staff_id = o.staff_id 
GROUP BY employee, s.store_id
ORDER BY orders_sold DESC;

-- Query 11: Which stores are out of stock on a product?

SELECT 
	sk.store_id,
	sr.store_name,
	sk.product_id,
	p.product_name,
	sk.quantity
FROM production.stocks sk
JOIN production.products p 
  ON p.product_id = sk.product_id 
JOIN sales.stores sr 
  ON sr.store_id = sk.store_id 
WHERE sk.quantity = 0
ORDER BY product_id;

--What were the top 10 selling products and the total units sold at each store, ranking the stores? Store 2 was consistently the top selling store across all 10 top selling products

WITH units_sold AS (
	SELECT
		oi.product_id,
		p.product_name,
		SUM(oi.quantity) AS total_sold
	FROM sales.order_items oi
	JOIN production.products p 
    ON p.product_id = oi.product_id
	GROUP BY oi.product_id, p.product_name
	ORDER BY total_sold DESC
	LIMIT 10
	)
	SELECT 
		us.product_id,
		us.product_name,
		o.store_id,
		RANK() OVER(PARTITION BY us.product_id ORDER BY SUM(oi.quantity) DESC) AS store_rank,
		SUM(oi.quantity) AS store_units_sold
	FROM units_sold us
	JOIN sales.order_items oi 
    ON oi.product_id = us.product_id
	JOIN sales.orders o 
    ON o.order_id = oi.order_id
	GROUP BY o.store_id, us.product_id, us.product_name
	ORDER BY store_units_sold desc;
