ALTER TABLE customers
ALTER COLUMN age ADD MASKED WITH (FUNCTION = 'default()');

GRANT UNMASK TO etl_engineer;
GRANT UNMASK TO dev_tester;