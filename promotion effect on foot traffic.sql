with promotion as(select Promotion,Product_Position, count(Foot_Traffic) as 'foot_traffic_count'
	from TotalSalesByProduct
	where Promotion='Yes'
	group by Promotion,Product_Position 
	),	
	no_promotion as (select Promotion,Product_Position , count(Foot_Traffic) as 'foot_traffic_count'
	from TotalSalesByProduct
	where Promotion='No'
	group by Promotion,Product_Position 
	)


	
	select promotion.Promotion, promotion.Product_Position,promotion.foot_traffic_count,
	no_promotion.Promotion, no_promotion.Product_Position,no_promotion.foot_traffic_count,
	round((( (promotion.foot_traffic_count-no_promotion.foot_traffic_count)*100)/no_promotion.foot_traffic_count),2 )as '% Foot Traffic'
	from promotion inner join no_promotion on promotion.Product_Position = no_promotion.Product_Position;