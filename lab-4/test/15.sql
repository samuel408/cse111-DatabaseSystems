.headers on
SELECT
    r.r_name AS region,
    s.s_name AS supplier,
    s.s_acctbal AS acct_bal
FROM
    supplier AS s
JOIN
    nation AS n
ON
    s.s_nationkey = n.n_nationkey
JOIN
    region AS r
ON
    n.n_regionkey = r.r_regionkey
WHERE
    (r.r_name, s.s_acctbal) IN (
        SELECT
            r1.r_name,
            MAX(s1.s_acctbal)
        FROM
            region AS r1
        JOIN
            nation AS n1
        ON
            r1.r_regionkey = n1.n_regionkey
        JOIN
            supplier AS s1
        ON
            n1.n_nationkey = s1.s_nationkey
        GROUP BY
            r1.r_name
    )
ORDER BY
    region;
