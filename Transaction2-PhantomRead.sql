/*
	TRANSACTION 2
    - Handles the Read(X) Operation
*/

-- Set Isolation Level
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;


-- -------------------------------------
-- Scenario 3 (Phantom Read)
-- FLOW: Execute first read, then while waiting, execute corresponding
-- query in Transaction 1, next query and commit will then be executed

START TRANSACTION;
	SELECT COUNT(*)
    FROM datawarehouseho3.accounts
    WHERE id BETWEEN 1 and 10;
    
    DO SLEEP(10);
    
	SELECT COUNT(*)
    FROM datawarehouseho3.accounts
    WHERE id BETWEEN 1 and 10;
COMMIT;