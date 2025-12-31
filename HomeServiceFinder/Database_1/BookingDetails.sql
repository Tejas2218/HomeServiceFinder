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

select * from BookingDetails

select * from UserDetails
select * from ServiceProviderDetails
select * from EquipmentMaster

insert into BookingDetails(Booking_Status,User_ID,SP_ID,Booking_Rating,Booking_Decline_Reason,Equipment_ID,Time_Slot,Visiting_DateTime)
	values('Pending',14,7,4,null,1,'4-5',GETDATE())

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

-----------view booking for user side
CREATE or alter PROCEDURE View_User_Booking_Details
    @User_ID INT
AS
BEGIN
    SELECT *
    FROM BookingDetails
    WHERE User_ID = @User_ID
END

exec View_User_Booking_Details 10

------------delete booking
create or alter proc Delete_Booking_Details
@Booking_ID int
as
begin
    delete from BookingDetails where Booking_ID = @Booking_ID
end

---------delete booking details
CREATE OR ALTER PROCEDURE Get_Booking_Cancel_Details
    @Booking_ID INT
AS
BEGIN
    SELECT 
        b.Booking_ID,
        b.Visiting_DateTime,
        b.Time_Slot,

        -- CUSTOMER EMAIL
        u.User_EmailID AS UserEmail,

        -- SERVICE PROVIDER DETAILS
        spu.User_EmailID AS ProviderEmail,
        spu.User_Name    AS ProviderName

    FROM BookingDetails b

    -- CUSTOMER
    INNER JOIN UserDetails u 
        ON b.User_ID = u.User_ID

    -- SERVICE PROVIDER
    INNER JOIN ServiceProviderDetails sp 
        ON b.SP_ID = sp.SP_ID

    INNER JOIN UserDetails spu
        ON sp.User_ID = spu.User_ID

    WHERE b.Booking_ID = @Booking_ID
END




---------------view booking for service provider side 
create or alter proc View_Booking_Details
@SP_ID int,
@Booking_Status varchar(10)
as 
begin 
	select * from BookingDetails as BD inner join UserDetails as UD on BD.User_ID=UD.User_ID 
	inner join EquipmentMaster as EM on BD.Equipment_ID = EM.Equipment_ID 
	where BD.SP_ID=@SP_ID and BD.Booking_Status=@Booking_Status and BD.Visiting_DateTime > GetDate() --- reexecute
end


exec View_Booking_Details 7

-----------------update booking status for service provider side
create or alter proc Update_Booking_Status
@Booking_ID int,
@Booking_Status varchar(10)
as begin 
	update BookingDetails set Booking_Status=@Booking_Status where Booking_ID=@Booking_ID;
end

select * from BookingDetails


--------------------booking pending notification
create or alter proc Notification_Pending_Booking
@SP_ID int
as 
Begin
	Select Count(*) as noti from BookingDetails where SP_ID = @SP_ID  and Booking_Status = 'Pending'; 
end

-----------------Total booking
create or alter proc Total_Booking
@SP_ID int 
as 
begin
	Select Count(*) as Total from BookingDetails where SP_ID = @SP_ID and Booking_Status = 'Accept';
end

-------------Avg rating of service provider
create or alter proc Avg_Rating
@SP_ID int 
as 
begin
	Select SP_AverageRating from ServiceProviderDetails where SP_ID = @SP_ID
end