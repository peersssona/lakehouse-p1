CREATE TABLE lakehouse.bronze.customer WITH (format = 'PARQUET') AS
SELECT custkey, mktsegment
FROM tpch.sf1.customer;

CREATE TABLE lakehouse.bronze.orders WITH (format = 'PARQUET') AS
SELECT orderkey, custkey, orderdate, shippriority
FROM tpch.sf1.orders;

CREATE TABLE lakehouse.bronze.lineitem WITH (format = 'PARQUET') AS
SELECT orderkey, extendedprice, discount, shipdate
FROM tpch.sf1.lineitem;