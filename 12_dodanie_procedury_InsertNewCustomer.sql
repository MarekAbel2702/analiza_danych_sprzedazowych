CREATE PROCEDURE sp_InsertNewCustomer
	@Gender VARCHAR(50),
	@Age INT,
	@City VARCHAR(150)
AS
BEGIN
	INSERT INTO customers (gender, age, city, signup_date)
	VALUES (@Gender, @Age, @City, GETDATE());
END