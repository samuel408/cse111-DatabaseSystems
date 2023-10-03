.headers on
select avg(c_acctbal)
from customer natural join nation natural join region
where r_regionkey = n_regionkey and n_nationkey = c_nationkey and r_name = 'AMERICA' and c_mktsegment = 'FURNITURE';