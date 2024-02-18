--a. Get all the details from the person table including email ID, phone
--number and phone number type
select * from person.EmailAddress ea  inner join person.personphone pp on 
ea.businessentityid = pp.BusinessEntityID inner join person.phonenumbertype pt on 
pp.phonenumbertypeid= pt.phonenumbertypeid

--b. Get the details of the sales header order made in May 2011.
select * from  sales.salesorderheader where orderdate between '2011-05-01' and '2011-05-31'

--c. Get the details of the sales details order made in the month of May2011

select * from  sales.SalesOrderDetail sod inner join sales.salesorderheader shd
on sod.salesorderid = shd.salesorderid 
where shd.orderdate between '2011-05-01' and '2011-05-31'

--d. Get the total sales made in May 2011.

select sum (linetotal) totalsal from sales.salesorderheader shd inner join sales.salesorderdetail sod
on shd.SalesOrderID = sod.SalesOrderID
where shd.orderdate between '2011-05-01' and '2011-05-31'
select * from sales.salesorderheader


--e. Get the total sales made in the year 2011 by month order by increasing sales.
select (linetotal) totalsum,month(orderdate) salesmonth from sales.salesorderdetail sd join sales.salesorderheader shd
on sd.SalesOrderID = shd.SalesOrderID where year(orderdate) = 2011
group by month(orderdate)
order by totalsale


--f. Get the total sales made to the customer with FirstName='Gustavo'
--and LastName ='Achong'
select firstname,lastname,sum(linetotal) as totalsale from person.person p inner join sales.customer cc
on p.businessentityid = cc.PersonID inner join sales.salesorderheader sd on sd.CustomerID=cc.CustomerID
inner join sales.salesorderdetail sod on sod.salesorderid= sd.salesorderid 
where p.firstname = 'gustavo' and p.lastname = 'achong'
group by p.BusinessEntityID,p.firstname,p.lastname;