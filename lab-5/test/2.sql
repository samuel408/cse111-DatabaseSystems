.headers on

SELECT
    o_orderpriority AS priority,
    COUNT(*) AS item_cnt
FROM
    orders 
JOIN
    lineitem l ON o_orderkey = l.l_orderkey
WHERE
    l.l_receiptdate like '1995%'
    AND l.l_receiptdate < l.l_commitdate
GROUP BY
    o_orderpriority
ORDER BY
    o_orderpriority;