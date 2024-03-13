/*
	TRANSACTION 2
    - Handles the Read(X) Operation
*/

-- Set Isolation Level
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;


-- Scenario 2 (Non-repeatable Read)
-- FLOW: Execute this query from Transaction 2 first,
-- while DO SLEEP(10) is executing, run corresponding query in Transaction 1

START TRANSACTION;
	SELECT amount 
    FROM datawarehouseho3.accounts
    WHERE id = 3;
    
    DO SLEEP(10);
    
    SELECT amount 
    FROM datawarehouseho3.accounts
    WHERE id = 3;
COMMIT;