.headers ON
SELECT
    s.s_name || '|' || COUNT(DISTINCT ps.ps_partkey) AS SupplierAndPartCount
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
    part AS p
ON
    ps.ps_partkey = p.p_partkey
WHERE
    n.n_name = 'KENYA'
    AND p.p_container LIKE '%BOX%'
GROUP BY
    s.s_name
ORDER BY
    COUNT(DISTINCT ps.ps_partkey) DESC;
