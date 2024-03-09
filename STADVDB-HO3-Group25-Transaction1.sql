/*
	TRANSACTION 1
	This script file handles the write transactions to be done
*/

-- Insert initial values into table
INSERT INTO datawarehouseho3.accounts (amount) VALUES(10);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(200);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(3000);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(40000);
INSERT INTO datawarehouseho3.accounts (amount) VALUES(500000);


-- Scenario 1 (Dirty Read)
-- FLOW: Execute this, while DO SLEEP(10) is running, execute
-- corresponding query in Transaction 2
START TRANSACTION;
	UPDATE accounts 
    SET amount = 2 * amount
    WHERE id = 5;
	DO SLEEP(10);
COMMIT;

-- Scenario 2 (Non-repeatable Read)
-- FLOW: Execute this, while DO SLEEP(10) in Transaction 2 is running
START TRANSACTION;
	UPDATE accounts 
    SET amount = 2 * amount
    WHERE id = 5;
COMMIT;

-- Scenario 3 (Phantom Read)
-- FLOW: Execute this, while DO SLEEP(10) is running, execute
-- corresponding query in Transaction 2
START TRANSACTION;
	INSERT INTO accounts values(6, 1500);
    INSERT INTO accounts values(7, 20000);
    INSERT INTO accounts values(8, 300);
    INSERT INTO accounts values(9, 1250);
COMMIT;
    