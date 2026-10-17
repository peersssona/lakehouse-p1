CREATE SCHEMA IF NOT EXISTS lakehouse.silver;

CREATE TABLE lakehouse.silver.order_lines
WITH (format = 'PARQUET', partitioning = ARRAY['year(orderdate)']) AS
SELECT o.orderkey, o.orderdate, o.shippriority,
       l.extendedprice, l.discount, l.shipdate
FROM lakehouse.bronze.customer c
JOIN lakehouse.bronze.orders   o ON c.custkey = o.custkey
JOIN lakehouse.bronze.lineitem l ON l.orderkey = o.orderkey
WHERE c.mktsegment = 'BUILDING'
  AND o.orderdate < DATE '1995-03-15'
  AND l.shipdate  > DATE '1995-03-15';