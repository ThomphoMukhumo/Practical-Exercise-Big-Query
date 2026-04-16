---Q1 (WHERE CLAUSE) Filter all transactions that occurred in the year 2023
SELECT* 
 FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data` LIMIT 1000;

---Q2 Filtering + Conditions
---Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.
---Expected Output: All columns

SELECT *
FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`
WHERE `Total Amount` > (SELECT AVG (`Total Amount`) 
FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`);

--Q3 Agrregate functions
--Calculate the total revenue (sum of Total Amount).

SELECT*
FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`
Where Date BETWEEN '2023-01-01' AND '2023-12-31';



----Q4 Distinct
---Display all distinct Product Categories in the dataset
SELECT DISTINCT(`Product Category`)
FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`;


---Q5 Group by
---For each Product Category, calculate the total quantity sold.
SELECT
  `Product Category`,
  SUM(Quantity) AS `total_quantity_sold`
FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`
GROUP BY `Product Category`
ORDER BY `total_quantity_sold` DESC;

---Q6 CASE Statement
---Create a column called Age_Group that classifies customers as:
--– 'Youth' (<30) 'Adult' (30–59)
--– 'Senior' (60+)


SELECT `Customer ID`, Age,
CASE 
WHEN Age <30 THEN 'Youth'
WHEN Age BETWEEN 30 and 59 THEN 'Adult'
WHEN Age>= 60 THEN'Senior'
END AS `Age Group`
FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`;


----Q7 Conditional Aggregation
----For each Gender, count how many high-value transactions occurred (where Total Amount > 500).

SELECT `Gender`, COUNT(`Transaction ID`) AS High_Value_transaction
FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`
WHERE `Total Amount` > 500
GROUP BY `Gender`;

----Q8 HAVING CLAUSE
---For each Product Category, show only those categories where the total revenue exceeds 5,000

SELECT `Product Category` AS product_category, SUM(`Total Amount`) AS total_revenue
FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

----Q9 Calculated Fields
---Display a new column called Unit_Cost_Category that labels a transaction as:
---– 'Cheap' if Price per Unit < 50
--– 'Moderate' if Price per Unit between 50 and 200
--- 'Expensive' if Price per Unit > 200


SELECT `Transaction ID`, `Price per unit`,
CASE
  WHEN `Price per Unit`< 50 THEN 'Cheap'
   WHEN `Price per Unit`BETWEEN 50 AND 200 THEN 'Moderate'
   WHEN `Price per Unit`> 200 THEN 'Cheap' 
   END AS `Cost Category`
   FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`

 
   ---Q10 Combining WHERE and CASE

----Display all transactions from customers aged 40 or older and add a column Spending_Level showing:
----– 'High' if Total Amount > 1000
---– 'Low' otherwise



   SELECT `Customer ID`, Age, `Total Amount`,
CASE
  WHEN `Total Amount` >1000 THEN 'High'
  ELSE 'Low'
  END AS Spending_Level
  FROM `project-0790d2ff-214f-4def-8a8.Retail_Sales.Retail_Sales_Data`
  WHERE Age >=40
  ORDER BY Age ASC;
