CREATE SCHEMA IF NOT EXISTS lakehouse.gold;

CREATE TABLE lakehouse.gold.shipping_priority_top10
WITH (format = 'PARQUET') AS
SELECT orderkey,
       sum(extendedprice * (1 - discount)) AS revenue,
       orderdate,
       shippriority
FROM lakehouse.silver.order_lines
GROUP BY orderkey, orderdate, shippriority
ORDER BY revenue DESC
LIMIT 10;