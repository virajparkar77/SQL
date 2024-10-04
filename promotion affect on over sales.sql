with promotion as (select Promotion,sum(Total_Sales_0f_Product) as 'Total_sales_Promotion' from TotalSalesByProduct
					where Promotion='Yes'
					group by Promotion ),
	no_promotion as(select Promotion,sum(Total_Sales_0f_Product) as 'Total_sales_No_Promotion' from TotalSalesByProduct
					where Promotion='No'
					group by Promotion)

					select promotion.Promotion, promotion.Total_sales_Promotion,
					no_promotion.Promotion, no_promotion.Total_sales_No_Promotion, 
					round((( (promotion.Total_sales_Promotion-no_promotion.Total_sales_No_Promotion)*100)/no_promotion.Total_sales_No_Promotion),2 )as '% Foot Traffic'
					from promotion,no_promotion