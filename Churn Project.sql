select * from churn;
select * from customer;
select * from internet;
select * from sales;

-- Task 1: Find the average unit price of "Health and beauty" product Category.
select round(avg(UnitPrice), 2) [Average Unit Price]
from sales
where ProductLine = "Health and beauty";

-- Task2: Which month got highest gross income?
SELECT to_char(DateOfPurchase,'%m')
from sales
where GrossIncome = (select max(GrossIncome) from sales)

SELECT MONTH("2017/08/25") AS Month
from sales;

SELECT EXTRACT('%m', DateOfPurchase) AS month
FROM sales;

SELECT strftime('%m', DateOfPurchase)
from sales


-- Task 3: Calculate the sales based on payment and product. Sort them from highest to lowest
select ProductLine, Payment, (UnitPrice * Quantity) [Sales]
from sales
group by ProductLine
order by sales Desc;

-- Task 4: Which types of customer has high average customer rating?
select customer.CustomerType, round(avg(sales.CustomerRating), 2) [High Average Customer Rating]
from customer
inner join sales on customer.id = sales.ID
group by customer.CustomerType


--Task 5: How  much quantity is most frequently ordered together?
select DISTINCT(Quantity)[x], count(Quantity) [y]
from sales
group by x
order by y desc
limit 1



-- Task 6: Find out total sales based on branch and sort it in descending order.
select customer.Branch, sum(sales.UnitPrice* sales.Quantity) as Total_Sales
from sales
join Customer on customer.ID = sales.ID
group by customer.Branch

-- Task 7: Filter as per below criteria and find out the total quantity ordered based on customer type.  
-- Filter the female, who use health and beauty products and male who uses sports and travel
select Customer.CustomerType, sum(sales.Quantity) [Total_Quantity]
from sales
join customer on sales.ID = customer.ID
where (customer.Gender = "Male" AND sales.ProductLine = "Sports and travel") or	 (customer.Gender = "Female" AND sales.ProductLine = "Health and beauty")
group by ProductLine









-- Fetch first 10 rows from table “churn” 
select * 
from churn
limit 10

-- Find the first 10 customers who didn’t churned 
select * 
from churn
where churn = "No"
limit 10

-- Find the unique categories under payment method column 
select DISTINCT(PaymentMethod)[Unique Method]
from churn

-- Find the customer with maximum monthly charges and tenure 
select * 
from churn
where MonthlyCharges = (select max(monthlycharges) from churn)



-- Find the customer with 3rd highest monthly charges. 
select *
from churn
order by MonthlyCharges DESC
limit 1
offset 2

--to cross check the previous answer
select *
from churn
order by MonthlyCharges desc



-- Find the average monthly charges for non churn customers
select Avg(MonthlyCharges) [Average Monthly Charges]
from churn
where churn = "No"

-- Find those non churn customers whose monthly charges are between 100 and 150

select *
from churn
where (churn = "No") and MonthlyCharges BETWEEN 100 and 150

