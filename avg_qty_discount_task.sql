SELECT ... INTO variable: PL/pgSQL aur T-SQL mein variables mein query result assign karne ke liye.

create or replace function getprofit(productId varchar)
RETURNS double precision AS $$
DECLARE 
	sum_sales  double precision;
	sum_profit  double precision;
	profitPerc  double precision;
BEGIN
	select sum(sales) as sum_sales , sum(profit) as sum_profit into sum_sales, sum_profit 
	from sales where  product_id = productId;
	profitPerc :=  (sum_profit / sum_sales) * 100;
	return profitPerc;
END
$$ LANGUAGE plpgsql;

select getprofit('OFF-BI-10000756')

select * from sales

-----avg_qty_discount_task
	
create or replace function getcustomerpurchasedetails (customerId varchar)
RETURNS double precision as $$
DECLARE
	    avg_discount DOUBLE PRECISION;
        avg_quantity INT;
	    profitSales double precision;
BEGIN
	select avg(discount)as avg_discount, avg(quantity)as avg_quantity into avg_discount, avg_quantity  
	from sales where customer_id = customerId;
	profitSales :=  (avg_discount / avg_quantity) * 100;
	return profitSales;
END;
$$ LANGUAGE plpgsql;

select getcustomerpurchasedetails('CG-12520')

select avg(discount) as avg_discount , avg(quantity) as avg_quantity , avg(discount) / avg(quantity) as profitSales
	from sales where  customer_id = 'CG-12520' 	

select *,getcustomerpurchasedetails(customer_id) from sales
