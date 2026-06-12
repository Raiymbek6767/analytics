SELECT * FROM orders WHERE total_amount > 1000;

SELECT * FROM orders WHERE status='Completed';

SELECT * FROM orders WHERE order_date>'2025-01-01';

SELECT * FROM orders WHERE total_amount BETWEEN 500 AND 1000;

SELECT * FROM orders WHERE status='Cancelled';


SELECT status, COUNT(*)
FROM orders
GROUP BY status
HAVING COUNT(*) > 50;

SELECT customer_id, SUM(total_amount)
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 5000;

SELECT DATE_TRUNC('month', order_date),
COUNT(*)
FROM orders
GROUP BY 1
HAVING COUNT(*) > 20;

SELECT customer_id, AVG(total_amount)
FROM orders
GROUP BY customer_id
HAVING AVG(total_amount) > 1000;

SELECT status, AVG(total_amount)
FROM orders
GROUP BY status
HAVING AVG(total_amount) > 500;


eSELECT *
FROM orders o
JOIN customers c
ON o.customer_id=c.customer_id;

SELECT p.product_name,c.category_name
FROM products p
JOIN categories c
ON p.category_id=c.category_id;

SELECT o.order_id,c.full_name
FROM orders o
JOIN customers c
ON o.customer_id=c.customer_id;

SELECT oi.quantity,p.product_name
FROM order_items oi
JOIN products p
ON oi.product_id=p.product_id;

SELECT *
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id;

SELECT *
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id;

SELECT *
FROM products p
JOIN order_items oi
ON p.product_id=oi.product_id;

SELECT *
FROM categories c
JOIN products p
ON c.category_id=p.category_id;

SELECT o.order_id,p.product_name
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id;

SELECT c.full_name,p.product_name
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN order_items oi
ON o.order_id=oi.order_id
JOIN products p
ON oi.product_id=p.product_id;         


SELECT *,
RANK() OVER(
ORDER BY total_amount DESC)
FROM orders;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY status)
FROM orders;

SELECT *,
AVG(total_amount)
OVER()
FROM orders;

SELECT *,
SUM(total_amount)
OVER(ORDER BY order_date)
FROM orders;

SELECT *,
DENSE_RANK()
OVER(ORDER BY total_amount DESC)
FROM orders;


SELECT *
FROM orders
WHERE total_amount >
(
SELECT AVG(total_amount)
FROM orders
);

WITH monthly_sales AS (
SELECT DATE_TRUNC('month',order_date) month,
SUM(total_amount) sales
FROM orders
GROUP BY 1
)
SELECT * FROM monthly_sales;

SELECT *
FROM customers
WHERE customer_id IN (
SELECT customer_id
FROM orders
);

WITH top_customers AS (
SELECT customer_id,
SUM(total_amount) total
FROM orders
GROUP BY customer_id
)
SELECT *
FROM top_customers;

SELECT *
FROM orders
WHERE total_amount=
(
SELECT MAX(total_amount)
FROM orders
);



