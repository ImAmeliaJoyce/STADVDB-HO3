/*
	TRANSACTION 2
    - Handles the Read(X) Operation
*/

-- Set Isolation Level always before doing a transaction
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;


-- -------------------------------------
-- Scenario 1 (Dirty Read)
-- FLOW: Transaction 1 will write, then after DO SLEEP for 10 seconds
-- before COMMIT has executed, execute T2 script below ONLY for dirty read
START TRANSACTION;
	SELECT *
    FROM datawarehouseho3.accounts
    WHERE id = 5;
COMMIT;


-- -------------------------------------
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