DELETE FROM lakehouse.silver.order_lines_demo WHERE year(orderdate) = 1994;
SELECT count(*) AS after_delete FROM lakehouse.silver.order_lines_demo;
