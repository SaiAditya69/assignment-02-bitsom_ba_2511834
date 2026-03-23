## Anomaly Analysis

### Insert Anomaly
When a new customer is added without placing an order, the `orders_flat.csv` requires inserting a row with NULLs for order_id, product_id, and sales_rep. This wastes space and creates incomplete records.  
Example: Row 40 – customer "Priya Patel" added but order_id = NULL.

### Update Anomaly
If product price changes, it must be updated in every row referencing that product. Missing one row causes inconsistency.  
Example: Rows 12 and 18 show "Wireless Mouse" with inconsistent price values (₹799 vs ₹850).

### Delete Anomaly
If an order is deleted and that order was the only one for a sales rep, that rep’s information is also lost.  
Example: Deleting order 103 removes "Rahul Mehta" (sales rep) entirely.

## Normalization Justification
Keeping all data in one table causes redundancy—each order row repeats customer and product details. If a product price changes or a customer moves cities, we must update multiple rows, inviting inconsistencies.  

By separating Customers, Orders, and Products into distinct tables linked by keys, we ensure data integrity, easier updates, and minimize anomalies. For example, updating the price of “Laptop Bag” in the Products table automatically reflects across all orders.  

Additionally, normalization improves query efficiency and makes enforcing constraints (like foreign keys or NOT NULL) straightforward. For reporting, we can use joins rather than duplicated columns. In our dataset, this 3NF design eliminates insert and delete anomalies while maintaining logical data relationships. Although slightly more complex to query, it’s crucial for long-term consistency as data scales.
