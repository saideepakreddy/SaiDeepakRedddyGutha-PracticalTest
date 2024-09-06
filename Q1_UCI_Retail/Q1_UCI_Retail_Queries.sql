create table OnlineRetail(InvoiceNo varchar(15),StockCode varchar(15),Description varchar(50),
Quantity int,InvoiceDate Timestamp,UnitPrice decimal,CustomerID int,Country varchar(50));

set datestyle = 'ISO,DMY';

--show data_directory; 

copy OnlineRetail(InvoiceNo,StockCode,Description,Quantity,InvoiceDate,UnitPrice,CustomerID,Country)
from 'C:\Program Files\PostgreSQL\16\data\Online Retail.csv'
delimiter ','
CSV HEADER;





select CustomerID,sum(UnitPrice*Quantity) TotalAmount from OnlineRetail 
where CustomerID is not null and Quantity > 0 
group by CustomerID 
order by TotalAmount desc limit 10


select stockcode,Description,sum(quantity) as TotalQuantity from OnlineRetail
where quantity>0
group by stockcode,Description
order by TotalQuantity desc limit 10



select  to_char(invoicedate,'YYYY-MM') as YearMonth,to_char(invoicedate,'Month') as Month,
round(sum(UnitPrice*Quantity),2) as TotalRevenue  from OnlineRetail 
where quantity>0
group by to_char(invoicedate,'YYYY-MM'),to_char(invoicedate,'Month')
order by TotalRevenue desc limit 10