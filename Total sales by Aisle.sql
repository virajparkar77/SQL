select * from Product_Positioning;

create view TotalSalesByProduct as(select * , (Price * Sales_Volume) as Total_Sales_0f_Product 
from Product_Positioning);