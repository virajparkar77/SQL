

select Product_Position,sum([Total_Sales_0f_Product]) as Total_Sale_by_PPosition from TotalSalesByProduct
group by Product_Position
order by sum([Total_Sales_0f_Product]) desc;