.headers on
SELECT
    n.n_name AS Country,
    COUNT(DISTINCT s.s_suppkey) AS SupplierCount
FROM
    nation AS n
LEFT JOIN
    supplier AS s
ON
    n.n_nationkey = s.s_nationkey
WHERE
    n.n_name IN ('ARGENTINA', 'BRAZIL')
GROUP BY
    n.n_name
ORDER BY
    n.n_name;
