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

select * from BookingDetails

select * from UserDetails
select * from ServiceProviderDetails
select * from EquipmentMaster

insert into BookingDetails(Booking_Status,User_ID,SP_ID,Booking_Rating,Booking_Decline_Reason,Equipment_ID,Time_Slot,Visiting_DateTime)
	values('Pending',12,7,4,null,1,'4-5',GETDATE())

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

---------------view booking for service provider side 
create or alter proc View_Booking_Details
@SP_ID int 
as 
begin 
	select * from BookingDetails as BD inner join UserDetails as UD on BD.User_ID=UD.User_ID 
	inner join EquipmentMaster as EM on BD.Equipment_ID = EM.Equipment_ID 
	where BD.SP_ID=@SP_ID
end

exec View_Booking_Details 7

customer name
equipment name
time slot 
staus

