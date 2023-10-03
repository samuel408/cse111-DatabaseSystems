.headers on
SELECT
    COUNT(DISTINCT o.o_clerk) AS ClerksCount
FROM
    nation AS n
JOIN
    supplier AS s
ON
    n.n_nationkey = s.s_nationkey
JOIN
    orders AS o
ON
    s.s_suppkey = o.o_custkey
WHERE
    n.n_name = 'PERU';
