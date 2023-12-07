-- Task 1
select 
	"Marital Status" ,
	round(avg(age)) as rata_rata_umur
from customer 
where  "Marital Status" != ''
group by "Marital Status" ;

-- Task 2
select 
	gender  ,
	round(avg(age)) as rata_rata_umur
from customer 
group by gender ;

-- Task 3
with trs as(
	select 
		storeid,
		sum(qty) as total_quantity
	from transaction
	group by 1)
select 
	t.total_quantity,
	s.storename  
from trs as t
join store as s on t.storeid = s.storeid
order by t.total_quantity desc
limit 1;

-- Task 4
with total as(
	select 
		productid,
		sum(totalamount) as total_amount
	from transaction 
	group by productid)
select 
	p."Product Name",
	t.total_amount
from product as p
join total as t on p.productid = t.productid
order by t.total_amount desc 
limit 1;