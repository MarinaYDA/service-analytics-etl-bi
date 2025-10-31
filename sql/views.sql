-- KPI views (MySQL 8+ / Postgres compatible)

CREATE VIEW v_revenue_by_model AS
SELECT c.vehicle_model,
       SUM(o.price_usd) AS total_revenue,
       SUM(CASE WHEN o.service_type='install' THEN 1 ELSE 0 END) AS installs
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY c.vehicle_model;

CREATE VIEW v_warranty_rate_by_model AS
WITH installs AS (
  SELECT o.order_id, c.vehicle_model
  FROM orders o
  JOIN customers c ON c.customer_id = o.customer_id
  WHERE o.service_type='install'
),
claims AS (
  SELECT w.order_id
  FROM warranty w
)
SELECT i.vehicle_model,
       COUNT(*) AS installs,
       COUNT(c.order_id) AS claims,
       (COUNT(c.order_id) * 100.0) / NULLIF(COUNT(*), 0) AS warranty_rate_pct
FROM installs i
LEFT JOIN claims c ON c.order_id = i.order_id
GROUP BY i.vehicle_model;

CREATE VIEW v_avg_tat_by_region AS
SELECT region,
       ROUND(AVG(install_duration_minutes), 1) AS avg_install_minutes
FROM orders
WHERE service_type IN ('install','reconditioning')
GROUP BY region;
