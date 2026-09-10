-- 03_reporting.sql
-- CASE WHEN tiering, monthly reporting, and variance queries against bigbasket_capstone.db

-- (a) Tier each product by total Delivered revenue: High/Medium/Low
SELECT 
    p.product_id,
    p.product_name,
    SUM(o.amount_inr) AS total_revenue,
    CASE 
        WHEN SUM(o.amount_inr) >= 3000 THEN 'High'
        WHEN SUM(o.amount_inr) >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- (b) Monthly-by-category business report (Delivered orders only)
--     This exact query's output becomes monthly_category_revenue.csv
SELECT 
    p.category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(*) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category, month
ORDER BY p.category, month;

-- (c) Variance / percentage_variance vs category_targets
--     Uses * 100.0 to avoid SQLite integer division truncating to 0
SELECT 
    cat_rev.category,
    cat_rev.total_revenue,
    ct.target_revenue_inr,
    (ct.target_revenue_inr - cat_rev.total_revenue) AS variance,
    ((cat_rev.total_revenue - ct.target_revenue_inr) * 100.0) / ct.target_revenue_inr AS percentage_variance,
    CASE 
        WHEN cat_rev.total_revenue >= ct.target_revenue_inr THEN 'Above Target'
        WHEN ((ct.target_revenue_inr - cat_rev.total_revenue) * 100.0) / ct.target_revenue_inr <= 15 THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS status_tag
FROM (
    SELECT p.category, SUM(o.amount_inr) AS total_revenue
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    WHERE o.status = 'Delivered'
    GROUP BY p.category
) cat_rev
JOIN category_targets ct ON cat_rev.category = ct.category
ORDER BY cat_rev.category;