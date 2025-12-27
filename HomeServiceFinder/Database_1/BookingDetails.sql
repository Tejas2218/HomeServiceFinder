--Booking Detail--
use Home_Service_Finder

--Insert Booking Detail--
create or alter proc Insert_Booking_Details
    @Booking_Status varchar(50),
    @User_ID int,
    @SP_ID int,
    @Booking_Rating int,
    @Equipment_ID int,
    @Time_Slot varchar(10),
    @Visiting_DateTime datetime
as
begin
    insert into BookingDetails
    (
        Booking_Status,
        User_ID,
        SP_ID,
        Booking_Rating,
        Equipment_ID,
        Time_Slot,
        Visiting_DateTime
    )
    values
    (
        @Booking_Status,
        @User_ID,
        @SP_ID,
        @Booking_Rating,
        @Equipment_ID,
        @Time_Slot,
        @Visiting_DateTime
    )

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

----- view booking 