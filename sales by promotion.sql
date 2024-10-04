/*sales with repect to promotion*/



with promotion as(select Promotion, Product_Category, sum(Total_Sales_0f_Product) as 'total_Sales'
	from TotalSalesByProduct
	where Promotion='Yes'
	group by Promotion, Product_Category
	),	
	no_promotion as (select Promotion, Product_Category, sum(Total_Sales_0f_Product) as 'total_Sales'
	from TotalSalesByProduct
	where Promotion='No'
	group by Promotion, Product_Category
	)
	
	select promotion.Promotion, promotion.Product_Category,promotion.total_Sales,
	no_promotion.Promotion, no_promotion.Product_Category,no_promotion.total_Sales,
	round((( (promotion.total_Sales-no_promotion.total_Sales)*100)/no_promotion.total_Sales),2 )as '% Change in sales'
	from promotion inner join no_promotion on promotion.Product_Category = no_promotion.Product_Category;

