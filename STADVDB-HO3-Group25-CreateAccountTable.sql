/*
	This file creates the data warehouse for transactions
    Accounts(id, amount)
*/

CREATE SCHEMA `datawarehouseho3` ;

CREATE TABLE `datawarehouseho3`.`accounts` (
	id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2)
);

-- Check the values in the accounts table before inserting values
SELECT * FROM datawarehouseho3.accounts;

-- Insert initial values into table
INSERT INTO datawarehouseho3.accounts (amount) VALUES(10.00);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(200.00);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(3000.00);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(40000.00);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(500000.00);

-- Check the values in the accounts table after inserting values
SELECT * FROM datawarehouseho3.accounts;