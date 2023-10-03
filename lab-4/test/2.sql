.headers on
select c_name, count(o_orderkey)
from nation, customer, orders
where n_name = 'EGYPT' and n_nationkey = c_nationkey and c_custkey = o_custkey and o_orderdate >='1992-01-01' and o_orderdate <='1992-12-31'
group by c_name
