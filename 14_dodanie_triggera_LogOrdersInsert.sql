CREATE TRIGGER trg_LogOrdersInsert
ON orders
AFTER INSERT
AS
BEGIN
	INSERT INTO order_audit (order_id, inserted_by)
	SELECT order_id, SUSER_NAME()
	FROM inserted;
END