CREATE PROCEDURE sp_GetTopProductByRevenue
	@TOPN INT = 10
AS
BEGIN
	SELECT TOP (@TOPN)
	p.name AS product_name,
	SUM(o.quantity * o.price_per_unit * (1 - o.discount_percent / 100.00)) AS total_revenue
	FROM orders o
	JOIN products p ON o.product_id = p.product_id
	GROUP BY p.name
	ORDER BY total_revenue DESC;
END