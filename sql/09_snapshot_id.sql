SELECT max_by(snapshot_id, committed_at) FROM lakehouse.silver."order_lines_demo$snapshots";
