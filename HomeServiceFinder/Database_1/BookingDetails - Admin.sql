
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
create or alter proc Insert_Booking_Details_Admin
@Booking_Status varchar(50),
@User_ID int,
@SP_ID int,
@Booking_Rating int,
@Equipment_ID int,
@Time_Slot varchar(10),
@Visiting_DateTime datetime
as
begin
	insert into BookingDetails(Booking_Status,User_ID,SP_ID,Booking_Rating,Equipment_ID,Time_Slot,Visiting_DateTime)
	values(@Booking_Status,@User_ID,@SP_ID,@Booking_Rating,@Equipment_ID,@Time_Slot,@Visiting_DateTime)
	
	select SCOPE_IDENTITY() as Booking_ID
end
go

exec Insert_Booking_Details_Admin 
	'Pending',
	1,
	10,
	0,
	1,
	'9-10',
	GETDATE();
