.headers on

SELECT p.p_mfgr AS manufacturer
FROM part p
JOIN partsupp ps ON p.p_partkey = ps.ps_partkey
WHERE ps.ps_suppkey = '000000040'
ORDER BY ps.ps_availqty ASC
LIMIT 1;
