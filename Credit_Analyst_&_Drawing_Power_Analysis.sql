Select *
From customer_master;

Select	*
From credit_facility;

Select	*
From stock_dp;


-- Total Portfolio Exposure (Shows size of Loan Book)
Select SUM(Sanctioned_Limit_Lakhs)	As Total_Sanctioned,  SUM(Outstanding_Lakhs) As Total_Outstanding
From credit_facility;


-- Accounts Over-Limit or Fully Utilized (DP Breach)
Select	CF.Customer_ID, Sanctioned_Limit_Lakhs, Outstanding_Lakhs, Drawing_Power
From credit_facility As CF
Join stock_dp As DP
		On	CF.Customer_ID = DP.Customer_ID
Where Sanctioned_Limit_Lakhs <= Outstanding_Lakhs
And Outstanding_Lakhs >= Drawing_Power;


-- Industry-wise Exposure (Total Exposure to single industry)
Select Industry, SUM(Outstanding_Lakhs) As Total_Exposure
From customer_master AS CM
Join credit_facility As CF
	On CM.Customer_ID = CF.Customer_ID
Group By industry
Order By Industry desc ;


-- Top 10 Borrowers by Exposure
Select CM.Customer_ID, Company_Name, Sanctioned_Limit_Lakhs, Outstanding_Lakhs
From customer_master As CM
Join credit_facility As CF
	On CM.Customer_ID = CF.Customer_ID
Order By Outstanding_Lakhs Limit 10;


-- Utilization Percentage per Account
Select Customer_ID, (Outstanding_Lakhs/Sanctioned_Limit_Lakhs)*100 As Utilization
From credit_facility;


-- Rating-wise Exposure
Select Credit_Rating As Accounts, SUM(Outstanding_lakhs) As Exposure
From customer_master As CM
Join credit_facility As CF
	On CM.Customer_ID = CF.Customer_ID
Where (Outstanding_Lakhs/Sanctioned_Limit_Lakhs)
Group By Credit_Rating
Order By Exposure;


-- High Risk Accounts (Low Rating + High Utilization) > 90%
Select CM.Customer_ID, Credit_Rating, (Outstanding_Lakhs/Sanctioned_Limit_Lakhs)*100 As Utilization
From customer_master As CM
Join credit_facility AS CF
	On CM.Customer_ID = CF.Customer_ID
Where credit_rating in ('BBB' , 'BB', 'B')
And Outstanding_Lakhs/Sanctioned_Limit_Lakhs > 0.9;


-- DP Utilization
Select CF.Customer_ID, (Outstanding_Lakhs/Drawing_Power)*100 As DP_Utilization
From credit_facility As CF
Join stock_dp AS DP
	On CF.Customer_ID = DP.Customer_ID;


-- Accounts with DP Utilization >100%
Select CF.Customer_ID, Outstanding_Lakhs, Drawing_Power, (Outstanding_Lakhs/Drawing_Power)*100 As DP_Utilization
From credit_facility As CF
Join stock_dp AS DP
	On CF.Customer_ID = DP.Customer_ID
Where (Outstanding_Lakhs/Drawing_Power) > 1;


-- Relationship Analysis
Select Customer_ID, Company_Name, Vintage_Yrs, 
Case
	When Vintage_Yrs < 3 Then 'New'
    When Vintage_Yrs Between 3 And 7 Then 'Mid'
    When Vintage_Yrs >7 Then 'Old'
End As Status
From customer_master;


-- New Customers with High Exposure
Select CM.Customer_ID, Company_Name, Vintage_Yrs, Outstanding_Lakhs,
Case
	When Vintage_Yrs < 3 Then 'New'
    When Vintage_Yrs Between 3 And 7 Then 'Mid'
    When Vintage_Yrs >7 Then 'Old'
End As Status
From customer_master AS CM
Join credit_facility As CF
	On CM.Customer_ID =  CF.Customer_ID
Where Vintage_Yrs < 3 
And Outstanding_Lakhs > 100;


-- Expected Annual Interest Income
Select Customer_ID, (Outstanding_Lakhs * `ROI_%` /100) As Annual_Interest
From credit_facility;


-- Industry Wise Interest Income
Select Industry, Sum(Outstanding_Lakhs * `ROI_%` /100) As Annual_Interest
From customer_master As CM
Join credit_facility As CF
	On CM.Customer_ID = CF.Customer_ID
Group By Industry;

