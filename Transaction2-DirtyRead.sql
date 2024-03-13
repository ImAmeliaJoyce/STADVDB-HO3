/*
	TRANSACTION 2
    - Handles the Read(X) Operation
*/

-- Set Isolation Level always before doing a transaction
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET SESSION TRANSACTION ISOLATION LEVEL SERILIZABLE;


-- -------------------------------------
-- Scenario 1 (Dirty Read)
-- FLOW: Transaction 1 will write, then after DO SLEEP for 10 seconds
-- before COMMIT has executed, execute T2 script below ONLY for dirty read
START TRANSACTION;
	SELECT *
    FROM datawarehouseho3.accounts
    WHERE id BETWEEN 1 and 3;
COMMIT;