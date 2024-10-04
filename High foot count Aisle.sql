select Product_Position, count(Foot_Traffic) as 'Number of High count'
from TotalSalesByProduct
where Foot_Traffic='High'
group by Product_Position
order by count(Foot_Traffic) desc;

