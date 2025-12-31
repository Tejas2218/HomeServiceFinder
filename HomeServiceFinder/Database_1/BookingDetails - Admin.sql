
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

--Insert Booking Detail--
select * from BookingDetails
go

create or alter proc Insert_Booking_Details_Admin
@Booking_Status varchar(50),
@Booking_DateTime datetime Null,
@User_ID int,
@SP_ID int,
@Booking_Rating int,
@Booking_Decline_Reason varchar(100),
@Equipment_ID int,
@Time_Slot varchar(10),
@Visiting_DateTime datetime
as
begin
	insert into BookingDetails(Booking_Status,Booking_DateTime,User_ID,SP_ID,Booking_Rating,Booking_Decline_Reason,Equipment_ID,Time_Slot,Visiting_DateTime)
						values(@Booking_Status,@Booking_DateTime,@User_ID,@SP_ID,@Booking_Rating,@Booking_Decline_Reason,@Equipment_ID,@Time_Slot,@Visiting_DateTime)
	
	select SCOPE_IDENTITY() as Booking_ID
end
go

Declare @CurrentDateTime DateTime;
Set @CurrentDateTime = GetDate();
EXEC Insert_Booking_Details_Admin
@Booking_Status = 'Pending',
@Booking_DateTime = @CurrentDateTime,
@User_ID = 32,
@SP_ID = 6,
@Booking_Rating = 0,
@Booking_Decline_Reason = null,
@Equipment_ID = 1,
@Time_Slot = '9To10',
@Visiting_DateTime = @CurrentDateTime;
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


