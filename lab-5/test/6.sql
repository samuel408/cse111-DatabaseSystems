.headers on

SELECT
    'Supplier#' || s.s_suppkey AS supplier,
    p.p_size AS part_size,
    MAX(ps.ps_supplycost) AS max_cost
FROM
    supplier s
    JOIN partsupp ps ON s.s_suppkey = ps.ps_suppkey
    JOIN part p ON ps.ps_partkey = p.p_partkey
    JOIN nation n ON s.s_nationkey = n.n_nationkey
WHERE
    p.p_type LIKE '%STEEL%'
    AND n.n_name = 'AMERICA'
GROUP BY
    s.s_suppkey, p.p_size
ORDER BY
    supplier, part_size;
