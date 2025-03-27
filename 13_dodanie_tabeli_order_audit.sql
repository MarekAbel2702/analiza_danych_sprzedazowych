CREATE TABLE order_audit (
	audit_id INT PRIMARY KEY IDENTITY(1, 1),
	order_id INT,
	inserted_by SYSNAME,
	inserted_time DATE DEFAULT GETDATE()
);

