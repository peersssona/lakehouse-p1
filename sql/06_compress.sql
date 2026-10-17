CREATE SCHEMA IF NOT EXISTS lakehouse.bronze_gzip;
CREATE SCHEMA IF NOT EXISTS lakehouse.bronze_zstd;

CREATE TABLE lakehouse.bronze_gzip.customer WITH (format = 'PARQUET', compression_codec = 'GZIP') AS
  SELECT custkey, mktsegment FROM tpch.sf1.customer;
CREATE TABLE lakehouse.bronze_gzip.orders WITH (format = 'PARQUET', compression_codec = 'GZIP') AS
  SELECT orderkey, custkey, orderdate, shippriority FROM tpch.sf1.orders;
CREATE TABLE lakehouse.bronze_gzip.lineitem WITH (format = 'PARQUET', compression_codec = 'GZIP') AS
  SELECT orderkey, extendedprice, discount, shipdate FROM tpch.sf1.lineitem;

CREATE TABLE lakehouse.bronze_zstd.customer WITH (format = 'PARQUET', compression_codec = 'ZSTD') AS
  SELECT custkey, mktsegment FROM tpch.sf1.customer;
CREATE TABLE lakehouse.bronze_zstd.orders WITH (format = 'PARQUET', compression_codec = 'ZSTD') AS
  SELECT orderkey, custkey, orderdate, shippriority FROM tpch.sf1.orders;
CREATE TABLE lakehouse.bronze_zstd.lineitem WITH (format = 'PARQUET', compression_codec = 'ZSTD') AS
  SELECT orderkey, extendedprice, discount, shipdate FROM tpch.sf1.lineitem;
