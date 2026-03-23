-- Q1: List all customers from Mumbai along with their total order value
SELECT c.customer_name, COALESCE(SUM(p.price * od.quantity), 0) AS total_value
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN OrderDetails od ON o.order_id = od.order_id
LEFT JOIN Products p ON od.product_id = p.product_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_name;

-- Q2: Find the top 3 products by total quantity sold
SELECT p.product_name, SUM(od.quantity) AS total_qty
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_qty DESC
LIMIT 3;

-- Q3: List all sales representatives and the number of unique customers they have handled
SELECT s.salesrep_name, COUNT(DISTINCT o.customer_id) AS unique_customers
FROM SalesReps s
LEFT JOIN Orders o ON s.salesrep_id = o.salesrep_id
GROUP BY s.salesrep_name;

-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
SELECT o.order_id, SUM(p.price * od.quantity) AS total_value
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY o.order_id
HAVING SUM(p.price * od.quantity) > 10000
ORDER BY total_value DESC;

-- Q5: Identify any products that have never been ordered
SELECT p.product_name
FROM Products p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
WHERE od.product_id IS NULL;

