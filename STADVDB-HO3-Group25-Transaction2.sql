/*
	TRANSACTION 2
	This script file handles the read transactions to be done
    
    Isolation levels:
    - READ UNCOMMITTED
    - READ COMMITTED
    - REPEATABLE READ
    - SERIALIZABLE
*/
-- Scenario 1 (Dirty Read)
-- FLOW: Transaction 1 will write, then sleep for 10 seconds
-- before COMMIT has executed, execute script below ONLY

-- Edit Isolation Level
-- (replace "UNCOMMITTED" with isolation value assigned)
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;
	SELECT *
    FROM accounts
    WHERE id = 5;
COMMIT;

-- Scenario 2 (Non-repeatable Read)
-- FLOW: Execute this query from Transaction 2 first,
-- while DO SLEEP(10) is executing, run corresponding query in Transaction 1

-- Edit Isolation Level
-- (replace "UNCOMMITTED" with isolation value assigned)
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;
	SELECT amount 
    FROM accounts
    WHERE id = 5;
    
    DO SLEEP(10);
    
    SELECT amount 
    FROM accounts
    WHERE id = 5;
COMMIT;

-- Scenario 3 (Phantom Read)
-- FLOW: Execute first read, then while waiting, execute corresponding
-- query in Transaction 1, next query and commit will then be executed

-- Edit Isolation Level
-- (replace "UNCOMMITTED" with isolation value assigned)
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;
	SELECT *
    FROM accounts
    WHERE id BETWEEN 1 and 10;
    
    DO SLEEP(10);
    
	SELECT *
    FROM accounts
    WHERE id BETWEEN 1 and 10;
COMMIT;



