CREATE PROCEDURE sp_GetMonthlySalesForStore
	@StoreId INT
AS
BEGIN
	SELECT 
		FORMAT(order_date, 'yyyy-MM') AS sale_month,
		SUM(quantity * price_per_unit * (1 - discount_percent / 100.00)) AS monthly_revenue
		FROM orders
		WHERE store_id = @StoreId
		GROUP BY FORMAT(order_date, 'yyyy-MM')
		ORDER BY sale_month;
END