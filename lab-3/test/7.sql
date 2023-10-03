.headers ON
Select SUM(o_totalprice)
from nation natural join region natural join customer natural join orders
where n_regionkey = r_regionkey AND c_nationkey = n_nationkey AND c_custkey = o_custkey AND r_name = 'AMERICA' AND o_orderdate >= '1995-01-01' AND o_orderdate <= '1995-12-31';