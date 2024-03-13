/*
	TRANSACTION 1
    - Handles the Write(X) Operation
*/

-- Set Isolation Level
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;


-- -------------------------------------
-- Scenario 1 (Dirty Read)
-- FLOW: Execute the T1 transaction until DO SLEEP, while DO SLEEP is running,
-- go to T2 transaction and execute the corresponding query.
START TRANSACTION;
	UPDATE datawarehouseho3.accounts 
    SET amount = (0.04 * amount) + amount
    WHERE id = 5;
	DO SLEEP(10);
COMMIT;


-- -------------------------------------
-- Scenario 2 (Non-repeatable Read)
-- FLOW: Execute this, while DO SLEEP(10) in Transaction 2 is running
START TRANSACTION;
	UPDATE datawarehouseho3.accounts 
    SET amount = 1.5 * amount
    WHERE id = 3;
COMMIT;


-- -------------------------------------
-- Scenario 3 (Phantom Read)
-- FLOW: Execute this while DO SLEEP(10) is running in Transaction 2
START TRANSACTION;
	INSERT INTO datawarehouseho3.accounts (amount) VALUES(600000.00);
    INSERT INTO datawarehouseho3.accounts (amount) VALUES(70000.00);
    INSERT INTO datawarehouseho3.accounts (amount) VALUES(8000.00);
    INSERT INTO datawarehouseho3.accounts (amount) VALUES(900.00);
    DELETE FROM datawarehouseho3.accounts WHERE id=1;
    DELETE FROM datawarehouseho3.accounts WHERE id=4;
COMMIT;