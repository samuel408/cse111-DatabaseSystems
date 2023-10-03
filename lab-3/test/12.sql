.headers on

SELECT substr(o_orderdate, 1, 4) AS year,
       COUNT(*) AS count
FROM orders 
JOIN lineitem  ON o_orderkey = l_orderkey
JOIN supplier ON l_suppkey = s_suppkey
WHERE s_nationkey IN ('1', '2') AND o_orderpriority	 = '3-MEDIUM'
GROUP BY year
ORDER BY year;