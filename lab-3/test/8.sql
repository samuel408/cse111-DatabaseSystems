.headers on

SELECT DISTINCT c_nationkey
FROM Customer
JOIN Orders ON c_custkey = o_orderkey
WHERE DATEPART( o_orderdate	) = 1994
AND DATEPART( o_orderdate) = 12
ORDER BY c_nationkey;
