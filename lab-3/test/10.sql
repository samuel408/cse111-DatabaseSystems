.headers on

select s_name
from supplier natural join nation natural join region
where r_regionkey = n_regionkey AND n_nationkey = s_nationkey AND r_name = 'ASIA' AND s_acctbal > 5000
order by s_name asc;