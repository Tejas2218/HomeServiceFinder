
--dev 28-12-25--Admin
-----------------Total booking 
create or alter proc TotalAll_Booking
as 
begin
	Select Count(*) as Total from BookingDetails ;
end
go

-----------------Today booking 
create or alter proc Today_Booking
as 
begin
	Select Count(*) as Total from BookingDetails
	WHERE Booking_DateTime >= CAST(GETDATE() AS DATE)
  AND Booking_DateTime < DATEADD(DAY, 1, CAST(GETDATE() AS DATE));
end
go
-----------------Pending booking 
create or alter proc Pending_Booking
as 
begin
	Select Count(*) as Total from BookingDetails where Booking_Status='Pending';
end
go

--Display All Booking--
create or alter proc Display_All_Booking
as
begin
	select BD.Booking_Status,
			BD.Booking_DateTime,
			BD.Booking_Rating,
			BD.Booking_Decline_Reason,
			BD.Booking_ID,
			UD.User_Name as User_Name, 
			SUD.User_Name as Worker_Name,
			SM.Service_Name
	from BookingDetails BD
	join UserDetails UD 
	on BD.User_ID=UD.User_ID
	join ServiceProviderDetails SPD
	on BD.SP_ID=SPD.SP_ID
	join ServiceMaster SM
	on SPD.Service_ID=SM.Service_ID
	join UserDetails SUD
	on SPD.User_ID=SUD.User_ID
end
go

--Display All Booking Details ByID
create or alter proc Display_All_Booking_ByID
@Booking_ID int
as
begin
	select BD.Booking_Status as Booking_Status,
			BD.Booking_DateTime as Booking_DateTime,
			BD.Booking_Rating as Booking_Rating,
			BD.Booking_Decline_Reason as Booking_decline_Reason,
			BD.Booking_ID as Booking_ID,

			UD.User_Name as User_Name,
			UD.User_EmailID as User_EmailID,
			UD.User_Address as User_Address,
			UD.User_ContactNo as User_ContactNo,
			SD.State_Name as User_State_Name,
			CD.City_Name as User_City_Name,

			SUD.User_Name as Worker_Name,
			SUD.User_EmailID as Worker_EmailID,
			SUD.User_Address as Worker_Address,
			SUD.User_ContactNo as Worker_ContactNo,
			SWD.State_Name as Worker_State_Name,
			CWD.City_Name as Worker_City_Name,

			SPD.SP_Age,
			SPD.SP_ShopAddress,
			SPD.SP_Experience,
			SPD.SP_AverageRating,
			SPD.SP_MinimumPrice,
			SPD.SP_Status,
			SM.Service_Name
	from BookingDetails BD
	
	join UserDetails UD 
	on BD.User_ID=UD.User_ID
	join StateDetails SD
	on SD.State_ID=UD.State_ID
	join CityDetails CD
	on CD.City_ID=UD.City_ID
	
	join ServiceProviderDetails SPD
	on BD.SP_ID=SPD.SP_ID
	join UserDetails SUD
	on SPD.User_ID=SUD.User_ID
	join StateDetails SWD
	on SUD.State_ID=SWD.State_ID
	join CityDetails CWD
	on SUD.City_ID=CWD.City_ID
	join ServiceMaster SM
	on SPD.Service_ID=SM.Service_ID

	where Booking_ID=@Booking_ID
end
go


--Display Pending Booking--
create or alter proc Display_Pending_Booking
as
begin
	select * from BookingDetails where Booking_Status='Pending';
end
go 

--Display Completed Booking--
create or alter proc Display_Completed_Booking
as
begin
	select * from BookingDetails where Booking_Status='Completed';
end
go

--Display User Cancel Booking--
create or alter proc Display_User_Decine_Booking
as
begin
	select * from BookingDetails where Booking_Status='Cancel';
end
go

--Display Worker Decline Booking--
create or alter proc Display_User_Decine_Booking
as
begin
	select * from BookingDetails where Booking_Status='Decline';
end
go

--Display All Service--
create or alter proc Count_Service
as
begin
	select * from ServiceMaster
end
go

--Display All Service Provider--
create or alter proc Bind_Name_ServiceProvider
@Service_ID int
as
begin
	select * from ServiceProviderDetails SPD
	join UserDetails UD
	on SPD.User_ID=UD.User_ID
	where @Service_ID=SPD.Equipment_ID
end
go

select * from BookingDetails