-- Verification results from running the queries below against bigbasket_capstone.db
-- products count: 31
-- customers count: 50
-- orders count: 500
-- category_targets count: 6
-- Status breakdown: Cancelled: 42, Delivered: 434, Pending: 24

SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM category_targets;
SELECT status, COUNT(*) FROM orders GROUP BY status;