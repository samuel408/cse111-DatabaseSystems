.headers on

SELECT
    COUNT(DISTINCT s.s_suppkey) AS supp_count
FROM
    supplier s
JOIN
    partsupp ps ON s.s_suppkey = ps.ps_suppkey
JOIN
    part p ON ps.ps_partkey = p.p_partkey
WHERE
    p.p_type LIKE '%POLISHED%'
    AND p.p_size IN (10, 20, 30, 40);
