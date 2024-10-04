select Product_Category, sum(Sales_Volume) as 'Total Volume Sold'
from TotalSalesByProduct
group by Product_Category
order by sum(Sales_Volume) desc;