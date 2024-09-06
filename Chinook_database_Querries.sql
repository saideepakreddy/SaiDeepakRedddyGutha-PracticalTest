select count(*) from invoice_line


select G.Name as Genre_Name,sum(il.quantity*il.unit_price) as Sales from invoice_line il
inner join track t on il.track_id=t.track_id
inner join genre g on t.genre_id=g.genre_id
--where il.quantity >0 and il.unit_price >0
group by g.Name
order by Sales desc
limit 5


select billing_country,round(avg(total),2) AVGInvoiceTotal from invoice
group by billing_country
order by AVGInvoiceTotal desc


select cust.customer_id,cust.first_name,cust.last_name,round(Sum(invoice.total),2) as TotalAmount from Customer cust
inner join Invoice on cust.customer_id=invoice.customer_id
group by cust.customer_id,cust.first_name,cust.last_name
order by TotalAmount desc
limit 3

select emp.employee_id,emp.first_name,emp.last_name,round(sum(invoice.total),2) as Sales
from employee emp
inner join customer cust on emp.employee_id=cust.support_rep_id
inner join invoice on cust.customer_id=invoice.customer_id
group by emp.employee_id,emp.first_name,emp.last_name
having sum(invoice.total) > 750
order by sales desc

show data_directory;

copy(select G.Name as Genre_Name,sum(il.quantity*il.unit_price) as Sales from invoice_line il
inner join track t on il.track_id=t.track_id
inner join genre g on t.genre_id=g.genre_id
--where il.quantity >0 and il.unit_price >0
group by g.Name
order by Sales desc
limit 5) to 'C:/Program Files/PostgreSQL/16/data/pupulargenres.csv' with CSV HEADER


copy(select billing_country,round(avg(total),2) AVGInvoiceTotal from invoice
group by billing_country
order by AVGInvoiceTotal desc
) to 'C:/Program Files/PostgreSQL/16/data/avginvoicebycountry.csv' with CSV HEADER

copy(select cust.customer_id,cust.first_name,cust.last_name,round(Sum(invoice.total),2) as TotalAmount from Customer cust
inner join Invoice on cust.customer_id=invoice.customer_id
group by cust.customer_id,cust.first_name,cust.last_name
order by TotalAmount desc
limit 3) to 'C:/Program Files/PostgreSQL/16/data/mostvaluedcustomers.csv' with CSV HEADER


copy(select emp.employee_id,emp.first_name,emp.last_name,round(sum(invoice.total),2) as Sales
from employee emp
inner join customer cust on emp.employee_id=cust.support_rep_id
inner join invoice on cust.customer_id=invoice.customer_id
group by emp.employee_id,emp.first_name,emp.last_name
having sum(invoice.total) > 750
order by sales desc) to 'C:/Program Files/PostgreSQL/16/data/employeesalesover.csv' with CSV HEADER