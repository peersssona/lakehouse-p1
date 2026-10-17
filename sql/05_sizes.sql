SELECT 'silver.order_lines' AS t, count(*) AS n FROM lakehouse.silver.order_lines
UNION ALL SELECT 'gold.top10', count(*) FROM lakehouse.gold.shipping_priority_top10;

SELECT 'silver.order_lines' AS t, round(sum(file_size_in_bytes)/1048576.0, 3) AS mb, count(*) AS files
FROM lakehouse.silver."order_lines$files"
UNION ALL
SELECT 'gold.top10', round(sum(file_size_in_bytes)/1048576.0, 3), count(*)
FROM lakehouse.gold."shipping_priority_top10$files";

SELECT year(orderdate) AS y, count(*) AS n
FROM lakehouse.silver.order_lines GROUP BY 1 ORDER BY 1;