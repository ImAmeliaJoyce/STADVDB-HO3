/*
	This file creates the table for the transactions
    Accounts(id, amount)
*/

CREATE SCHEMA `datawarehouseho3` ;

CREATE TABLE `datawarehouseho3`.`accounts` (
	id INT AUTO_INCREMENT PRIMARY KEY,
    amount INT
);

-- Check the values in the accounts table
SELECT * FROM datawarehouseho3.accounts;