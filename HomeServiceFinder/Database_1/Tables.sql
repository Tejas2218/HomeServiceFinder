use Home_Service_Finder

--All Tables--
create table StateDetails(
	State_ID int primary key identity(1,1),
	State_Name varchar(50) unique
)


create table CityDetails(
	City_ID int primary key identity(1,1),
	City_Name varchar(50) unique,
	State_ID int Foreign Key References StateDetails(State_ID)
)

create table UserDetails(
	User_ID int primary key identity(1,1),
	User_Name varchar(50) not null,
	User_EmailID varchar(100) unique,
	User_Address varchar(200) not null,
	User_ContactNo bigint not null,
	User_Password varchar(50) not null,
	User_Role varchar(50) not null,
	City_ID int Foreign Key References CityDetails(City_ID),
	Created_DateTime DateTime DEFAULT Getdate(),
	Modified_DateTime DateTime DEFAULT Getdate(),
	State_ID varchar(50)-------changes 
)---------------created------

select * from UserDetails


alter table UserDetails alter column State_ID int

alter table UserDetails add constraint FK_UserDetails_State Foreign key (State_ID) References StateDetails(State_ID)



create table ServiceMaster(
	Service_ID int primary key identity(1,1),
	Service_Name varchar(50) unique,
)

create table EquipmentMaster(
	Equipment_ID int primary key identity(1,1),
	Equipment_Name varchar(50) unique,
	Service_ID int Foreign Key References ServiceMaster(Service_ID)
)

create table ServiceProviderDetails(
	SP_ID int primary key identity(1,1),
	User_ID int Foreign Key References UserDetails(User_ID),
	SP_Age int not null,
	SP_ShopAddress varchar(200) not null,
	SP_Service varchar(50) not null,
	SP_Experience int not null,
	SP_AverageRating int,
	SP_MinimumPrice int not null,
	Service_ID int Foreign Key References ServiceMaster(Service_ID),
	Equipment_ID int Foreign Key References EquipmentMaster(Equipment_ID)
)

create table BookingDetails(
	Booking_ID int primary key identity(1,1),
	Booking_Status varchar(50) not null,
	Booking_DateTime datetime DEFAULT Getdate() not null,
	User_ID int Foreign Key References UserDetails(User_ID),
	SP_ID int Foreign Key References ServiceProviderDetails(SP_ID),
	Booking_Rating int,
	Booking_Decline_Reason varchar(100) null
)



--------------SP for Select Service and view acccording to equipment for sign up----------------

create or alter proc View_ServiceMaster
as
Begin
Select * from ServiceMaster
end

create or alter proc View_Equipment_ByID
@Service_ID int
as 
Begin
Select * from EquipmentMaster where Service_ID = @Service_ID
end
exec View_Equipment_ByID 1

Insert into ServiceMaster(Service_Name) 
values('Plumbing')


Insert into EquipmentMaster(Equipment_Name,Service_ID) 
values('Tap Repairing',1)













--------------------------------------------------------------------------------------------- end --------------------------------------
select * from ServiceProviderDetails
select * from UserDetails
select * from BookingDetails
select * from ServiceMaster
select * from EquipmentMaster
select * from StateDetails
select * from CityDetails


----------worker side sp to fetch worker details and user for booking table

select * from ServiceProviderDetails;

select * from UserDetails
delete from UserDetails where User_ID=4

select * from BookingDetails INNER JOIN ServiceProviderDetails on BookingDetails.SP_ID = ServiceProviderDetails.SP_ID 
INNER JOIN UserDetails on ServiceProviderDetails.User_ID = UserDetails.User_ID where ServiceProviderDetails.User_ID = 1


select * from ServiceProviderDetails INNER JOIN UserDetails on ServiceProviderDetails.User_ID = UserDetails.User_ID INNER JOIN CityDetails on UserDetails.City_ID = CityDetails.City_ID where ServiceProviderDetails.User_ID = 1