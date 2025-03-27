CREATE TRIGGER trg_PreventHighDiscounts
ON orders
INSTEAD OF INSERT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM inserted WHERE discount_percent > 50)
	BEGIN
		RAISERROR('Zabroniono wstawiania zamówieñ z rabatem > 50%%', 16, 1);
		ROLLBACK;
		RETURN;
	END

	INSERT INTO orders (customer_id, product_id, quantity, price_per_unit,
    order_date, store_id, discount_percent, payment_method)
	SELECT customer_id, product_id, quantity, price_per_unit,
        order_date, store_id, discount_percent, payment_method FROM inserted;
END