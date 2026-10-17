SELECT count(*) AS from_snapshot FROM lakehouse.silver.order_lines_demo FOR VERSION AS OF {SID};
CALL lakehouse.system.rollback_to_snapshot('silver', 'order_lines_demo', {SID});
SELECT count(*) AS after_rollback FROM lakehouse.silver.order_lines_demo;
