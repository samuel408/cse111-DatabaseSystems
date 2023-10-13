.headers on

SELECT o.o_orderpriority AS priority, COUNT(DISTINCT o.o_orderkey) AS order_cnt
FROM orders o
WHERE strftime('%Y', o.o_orderdate) = '1995'
AND EXISTS (
    SELECT 1
    FROM lineitem l
    WHERE l.l_orderkey = o.o_orderkey
    AND l.l_receiptdate > l.l_commitdate
)
GROUP BY o.o_orderpriority
ORDER BY o.o_orderpriority;
