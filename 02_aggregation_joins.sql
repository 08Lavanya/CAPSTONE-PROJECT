-- 02_aggregation_joins.sql
-- Aggregation, join, and HAVING queries against bigbasket_capstone.db

-- (a) INNER JOIN orders + products, GROUP BY category, Delivered orders only,
--     HAVING total_revenue > 10000
SELECT 
    p.category,
    COUNT(*) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING total_revenue > 10000;

-- (b) LEFT JOIN products -> orders, GROUP BY product, using COUNT(o.order_id)
--     (not COUNT(*)) so products with zero orders show 0, not 1.
--     Ordered ascending to surface least-ordered products first.
SELECT 
    p.product_id,
    p.product_name,
    COUNT(o.order_id) AS total_orders
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_orders ASC;