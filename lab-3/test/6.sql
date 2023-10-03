.headers on
SELECT n_name, SUM(s_acctbal) AS total_balance
FROM supplier 
INNER JOIN nation ON n_name = n_name
GROUP BY n_name
ORDER BY n_name;
