/*Sales analysis based on promotion*/

with promotion as(select Promotion, Consumer_Demographics, sum(Total_Sales_0f_Product) as 'total_Sales'
	from TotalSalesByProduct
	where Promotion='Yes'
	group by Promotion, Consumer_Demographics
	),	
	no_promotion as (select Promotion, Consumer_Demographics, sum(Total_Sales_0f_Product) as 'total_Sales'
	from TotalSalesByProduct
	where Promotion='No'
	group by Promotion, Consumer_Demographics
	)
	
	select promotion.Promotion, promotion.Consumer_Demographics,promotion.total_Sales,
	no_promotion.Promotion, no_promotion.Consumer_Demographics,no_promotion.total_Sales,
	round((( (promotion.total_Sales-no_promotion.total_Sales)*100)/no_promotion.total_Sales),2 )as '% Change in sales'
	from promotion inner join no_promotion on promotion.Consumer_Demographics = no_promotion.Consumer_Demographics;


	
	



