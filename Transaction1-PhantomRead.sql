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
-- Scenario 3 (Phantom Read)
-- FLOW: Execute this while DO SLEEP(10) is running in Transaction 2
START TRANSACTION;
	INSERT INTO datawarehouseho3.accounts (amount) VALUES(600000.00);
    INSERT INTO datawarehouseho3.accounts (amount) VALUES(70000.00);
    DELETE FROM datawarehouseho3.accounts WHERE id=1;
    DELETE FROM datawarehouseho3.accounts WHERE id=4;
COMMIT;