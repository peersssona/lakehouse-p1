SELECT count(*) AS from_snapshot FROM lakehouse.silver.order_lines_demo FOR VERSION AS OF 933142705376780523;
CALL lakehouse.system.rollback_to_snapshot('silver', 'order_lines_demo', 933142705376780523);
SELECT count(*) AS after_rollback FROM lakehouse.silver.order_lines_demo;

