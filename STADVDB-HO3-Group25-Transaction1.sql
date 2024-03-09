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
	UPDATE datawarehouseho3.accounts 
    SET amount = 2 * amount
    WHERE id = 5;
	DO SLEEP(10);
COMMIT;

-- Scenario 2 (Non-repeatable Read)
-- FLOW: Execute this, while DO SLEEP(10) in Transaction 2 is running
START TRANSACTION;
	UPDATE datawarehouseho3.accounts 
    SET amount = 2 * amount
    WHERE id = 5;
COMMIT;

-- Scenario 3 (Phantom Read)
-- FLOW: Execute this, while DO SLEEP(10) is running, execute
-- corresponding query in Transaction 2
START TRANSACTION;
	INSERT INTO datawarehouseho3.accounts (amount) VALUES(600000);
    INSERT INTO datawarehouseho3.accounts (amount) VALUES(70000);
    INSERT INTO datawarehouseho3.accounts (amount) VALUES(8000);
    INSERT INTO datawarehouseho3.accounts (amount) VALUES(900);
COMMIT;
    