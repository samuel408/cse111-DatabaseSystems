.headers on
-- minimum account balance 
SELECT MIN(c_acctbal) AS min_balance
FROM customer
WHERE c_mktsegment = 'FURNITURE':

-- maximum account balance 
SELECT MAX(c_acctbal) AS max_balance 
FROM customer
WHERE c_mktsegment = 'FURNITURE';

-- Total account balance

SELECT SUM(c_acctbal) AS total_balance
FROM customer 
WHERE c_mktsegment ='FURNITURE';
