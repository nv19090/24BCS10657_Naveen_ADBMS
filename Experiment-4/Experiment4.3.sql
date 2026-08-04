-- 1.All orders with Customers Details: Get all of the orders table and also the details of respective customers if they exist. Use the customer and orders table.
SELECT c.customer_name, o.order_id, o.customer_id, o.product_name, o.order_date, o.quantity FROM orders o LEFT JOIN customers c ON o.customer_id = c.customer_id;

-- 2.Products and Categories: Create a combined list of all products and all categories. Include all product names and all category names. Where there's a match, show both; otherwise, use NULLs.
SELECT p.product_name, c.category_name FROM products p INNER JOIN categories c ON p.category_id = c.category_id;

-- 3.All category names with product details: display category_name, along with all product names and price from all the categories present in categories table.
SELECT c.category_name, p.product_name, p.price FROM categories c LEFT JOIN products p ON c.category_id = p.category_id ORDER BY p.product_id;
