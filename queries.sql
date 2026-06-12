SELECT * FROM orders WHERE total_amount > 1000;

SELECT * FROM orders WHERE status='Completed';

SELECT * FROM orders WHERE order_date>'2025-01-01';

SELECT * FROM orders WHERE total_amount BETWEEN 500 AND 1000;

SELECT * FROM orders WHERE status='Cancelled';
