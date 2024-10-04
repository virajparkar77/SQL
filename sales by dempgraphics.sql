select * from TotalSalesByProduct;

select Consumer_demographics, sum([Total_Sales_0f_Product]) as 'Sales by Dempghaphics'
from TotalSalesByProduct
group by Consumer_demographics
order by sum([Total_Sales_0f_Product]) desc;