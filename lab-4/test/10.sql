.headers on
SELECT
    p.p_type AS part_type,
    COALESCE(MIN(l.l_discount), 0) AS min_disc,
    COALESCE(MAX(l.l_discount), 0.1) AS max_disc
FROM
    part AS p
LEFT JOIN
    lineitem AS l
ON
    p.p_partkey = l.l_partkey
WHERE
    p.p_type LIKE '%ECONOMY%'
    OR p.p_type LIKE '%COPPER%'
GROUP BY
    p.p_type
ORDER BY
    p.p_type;
