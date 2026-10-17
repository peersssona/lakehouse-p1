CREATE TABLE lakehouse.silver.order_lines_demo WITH (format = 'PARQUET') AS
SELECT * FROM lakehouse.silver.order_lines;

ALTER TABLE lakehouse.silver.order_lines_demo ADD COLUMN revenue double;
UPDATE lakehouse.silver.order_lines_demo SET revenue = extendedprice * (1 - discount);
ALTER TABLE lakehouse.silver.order_lines_demo RENAME COLUMN shippriority TO ship_priority;

DESCRIBE lakehouse.silver.order_lines_demo;
SELECT orderkey, ship_priority, extendedprice, discount, revenue
FROM lakehouse.silver.order_lines_demo LIMIT 5;
