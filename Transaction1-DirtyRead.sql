/*
	TRANSACTION 1
    - Handles the Write(X) Operation
*/

-- Set Isolation Level
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET SESSION TRANSACTION ISOLATION LEVEL SERILIZABLE;


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