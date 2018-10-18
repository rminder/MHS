-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 15-October, 2018
-- Description: With vehicle data, we bring in new data each month.
--   We won't be updating data.
--
-- Note: At the time this was created, this proc is not designed
-- to be called from within an SSIS package. The files must be
-- added one at a time. The best way to do this is by selecting
-- the Import Flat File option and name the file something like
-- dbo.20180930. Then change the parameter value, the From clause
-- reading rows from staing and the Drop Table statement.
--
-- Exec [Pay].[UpdateVehicle] 20180831
-- ===============================================================
CREATE PROCEDURE [Pay].[UpdateVehicle] @YearMonth INT
AS
BEGIN
	SET NOCOUNT ON;

	-- Delete any rows that exist for the target year and month
	DELETE FROM ODS.Pay.Vehicle
	WHERE YearMonth = @YearMonth;

	-- Import what's in staging
	INSERT INTO ODS.[Pay].[Vehicle]
		 ([YearMonth]
		 ,[Vehicle]
		 ,[MasterCustomerNumber]
		 ,[MasterCustomerName]
		 ,[CustomerNumber]
		 ,[CustomerName]
		 ,[CustomerVehicleIdCostCode]
		 ,[Driver]
		 ,[Vin]
		 ,[Year]
		 ,[Make]
		 ,[Model]
		 ,[Series]
		 ,[LicenseState]
		 ,[LicenseNumber]
		 ,[LicenseExpirationDate]
		 ,[DeliveryDate]
		 ,[FleetVehicleStatus]
		 ,[FleetVehicleStatusDescription]
		 ,[LeaseType]
		 ,[LeaseTerm]
		 ,[MonthsInService]
		 ,[ContractMileage]
		 ,[DeliveredPrice]
		 ,[DepreciationPercent]
		 ,[DepreciationAmountMonth]
		 ,[TotalLeaseChargeMonth]
		 ,[UseTaxAmountMonth]
		 ,[FullMaintenanceRateMonth]
		 ,[TotalRentMonth]
		 ,[L&T]
		 ,[ServiceCharge]
		 ,[CurrentRbv]
		 ,[CalculatedMileage]
		 ,[CalculatedMileageDate]
		 ,[EnteredMileage]
		 ,[EnteredMileageDate]
		 ,[GarageStreetAddress1]
		 ,[GarageCity]
		 ,[GarageState]
		 ,[GarageCountyName]
		 ,[GaragePostalCode]
		 ,[GarageCountry]
		 ,[RevenueProducing]
		 ,[VehicleType]
		 ,[InsCategory]
		 ,[Count]
		 ,[Location]
		 ,[Parent]
		 ,[Reg])
	SELECT
		@YearMonth
	   ,[Vehicle]
	   ,[Master_Cust_Num]
	   ,[Master_Cust_Name]
	   ,[Cust_Num]
	   ,[Cust_Name]
	   ,ISNULL([Customer_Vehicle_ID_Cost_Code],'')
	   ,ISNULL([Driver],'')
	   ,[VIN]
	   ,[Year]
	   ,ISNULL([Make],'')
	   ,ISNULL([Model],'')
	   ,ISNULL([Series],'')
	   ,ISNULL([License_State],'')
	   ,ISNULL([License_Num],'')
	   ,[License_Exp__Date]
	   ,[Delivery_Date]
	   ,[Fleet_Vehicle_Status]
	   ,[Fleet_Vehicle_Status_Description]
	   ,ISNULL([Lease_Type],'')
	   ,[Lease_Term]
	   ,[Months_In_Service_]
	   ,[Contract_Mileage]
	   ,[Delivered_Price]
	   ,[Dep_Pct]
	   ,[Dep_Amt_Mo]
	   ,[Total_Lease_Charge_Mo]
	   ,[Use_Tax_Amt_Mo]
	   ,[Full_Maint_Rate_Mo]
	   ,[Total_Rent_Mo]
	   ,[L_T_]
	   ,[Service_Charge]
	   ,[Current_RBV_]
	   ,[Calculated_Mileage]
	   ,[Calculated_Mileage_Date]
	   ,[Entered_Mileage]
	   ,[Entered_Mileage_Date]
	   ,ISNULL([Garage_Street_Address_1],'')
	   ,ISNULL([Garage_City],'')
	   ,ISNULL([Garage_State ],'')
	   ,ISNULL([Garage_County_Name],'')
	   ,ISNULL([Garage_Postal_Code],'')
	   ,ISNULL([Garage_Country],'')
	   ,ISNULL([Revenue_Producing],'')
	   ,ISNULL([Vehicle_Type],'')
	   ,ISNULL([Ins_Category],'')
	   ,[Count]
	   ,[Loc]
	   ,[Parent]
	   ,[Reg]
	FROM ODSStaging.[dbo].[20180831]
	WHERE Vehicle IS NOT NULL;

	DROP TABLE ODSStaging.[dbo].[20180831]

END;