.headers on

select distinct l_receiptdate as Ddate, count(l_linenumber) as Total
from customer natural join lineitem natural join orders
where c_custkey = o_custkey AND c_name = 'Customer#000000227' AND l_orderkey = o_orderkey
group by l_receiptdate;