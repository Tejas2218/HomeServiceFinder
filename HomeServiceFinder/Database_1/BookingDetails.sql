--Booking Detail--
use Home_Service_Finder

--Insert Booking Detail--
alter proc Insert_Booking_Details
@Booking_Status varchar(50),
@User_ID int,
@SP_ID int,
@Booking_Rating int
as
begin
	insert into BookingDetails(Booking_Status,User_ID,SP_ID,Booking_Rating)
	values(@Booking_Status,@User_ID,@SP_ID,@Booking_Rating)
	
	select SCOPE_IDENTITY() as Booking_ID
end

--Update Booking Detail--
create proc Update_Booking_Details
@Booking_ID int,
@Booking_Status varchar(50),
@User_ID int,
@SP_ID int,
@Booking_Rating int
as
begin
	update BookingDetails
	set Booking_Status=@Booking_Status,
		User_ID=@User_ID,
		SP_ID=@SP_ID,
		Booking_Rating=@Booking_Rating
	where Booking_ID=@Booking_ID
end

select * from BookingDetails
----- view booking 