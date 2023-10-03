.headers on
SELECT
    r.r_name AS region,
    MAX(s.s_acctbal) AS max_bal
FROM
    region AS r
JOIN
    nation AS n
ON
    r.r_regionkey = n.n_regionkey
JOIN
    supplier AS s
ON
    n.n_nationkey = s.s_nationkey
GROUP BY
    r.r_name
HAVING
    max_bal > 9000
ORDER BY
    r.r_name;
