SELECT regexp_extract(query, 'bronze_(gzip|zstd)', 1) AS codec,
       date_diff('millisecond', started, "end") AS ms
FROM system.runtime.queries
WHERE state = 'FINISHED'
  AND query LIKE '%sum(l.extendedprice%'
  AND query NOT LIKE '%system.runtime%'
  AND (query LIKE '%bronze_gzip%' OR query LIKE '%bronze_zstd%')
ORDER BY created;

SELECT 'gzip' AS codec, round(sum(s)/1048576.0, 2) AS mb FROM (
  SELECT sum(file_size_in_bytes) AS s FROM lakehouse.bronze_gzip."customer$files"
  UNION ALL SELECT sum(file_size_in_bytes) FROM lakehouse.bronze_gzip."orders$files"
  UNION ALL SELECT sum(file_size_in_bytes) FROM lakehouse.bronze_gzip."lineitem$files")
UNION ALL
SELECT 'zstd', round(sum(s)/1048576.0, 2) FROM (
  SELECT sum(file_size_in_bytes) AS s FROM lakehouse.bronze_zstd."customer$files"
  UNION ALL SELECT sum(file_size_in_bytes) FROM lakehouse.bronze_zstd."orders$files"
  UNION ALL SELECT sum(file_size_in_bytes) FROM lakehouse.bronze_zstd."lineitem$files");
