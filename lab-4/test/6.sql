.headers on
SELECT
    s.s_name AS Supplier,
    o.o_orderpriority AS Priority,
    COUNT(DISTINCT l.l_partkey) AS PartsCount
FROM
    supplier AS s
JOIN
    nation AS n
ON
    s.s_nationkey = n.n_nationkey
JOIN
    partsupp AS ps
ON
    s.s_suppkey = ps.ps_suppkey
JOIN
    lineitem AS l
ON
    ps.ps_partkey = l.l_partkey
JOIN
    orders AS o
ON
    l.l_orderkey = o.o_orderkey
WHERE
    n.n_name = 'INDONESIA'
GROUP BY
    s.s_name, o.o_orderpriority
ORDER BY
    s.s_name, o.o_orderpriority;
