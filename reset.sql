TRUNCATE TABLE datawarehouseho3.accounts;

-- Insert initial values into table
INSERT INTO datawarehouseho3.accounts (amount) VALUES(10);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(200);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(3000);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(40000);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(500000);

SELECT * FROM datawarehouseho3.accounts;
