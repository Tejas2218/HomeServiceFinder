--WorkerDetails--


---------------------------------------------------- not executed --------------------------------------------
--Display Worker Details--
alter proc Display_Worker_Details
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD  
	on SPD.User_ID=UD.User_ID 
	left join BookingDetails BD 
	on SPD.SP_ID=BD.SP_ID
end

--Display Worker Detail by Service--
alter proc Display_Worker_Details_ByService
@SP_Service varchar(50)
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD 
	on SPD.User_ID=UD.User_ID 
	left join BookingDetails BD
	on SPD.SP_ID=BD.SP_ID	 
	where SPD.SP_Service=@SP_Service
end

--Display Specific Worker Details--
alter proc Display_Worker_Details_ByID
@SP_ID int
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD 
	on SPD.User_ID=UD.User_ID 
	left join BookingDetails BD
	on SPD.SP_ID=BD.SP_ID
	where SPD.SP_ID=@SP_ID
end
---------------------------------------------------- not executed --------------------------------------------^
--Insert Worker Detail--
Create OR alter proc Insert_Worker_Details
@User_Name varchar(50),
@User_EmailID varchar(100),
@User_Address varchar(200),
@User_ContactNo bigint,
@User_Password varchar(50),
@User_Role varchar(50),
@City_ID int,
@State_ID int,
@Service_ID int,
@Equipment_ID int,
@SP_Age int ,
@SP_ShopAddress varchar(200),
@SP_Service varchar(50),
@SP_Experience int,
@SP_MinimumPrice int,
@SP_AverageRating int,
@SP_Status varchar(20)
as
begin
    DECLARE @User_ID INT;

	insert into UserDetails(
		User_Name,
		User_EmailID,
		User_Address,
		User_ContactNo,
		User_Password,
		User_Role,
		City_ID ,
		State_ID
	)
	values(
		@User_Name,
		@User_EmailID,
		@User_Address,
		@User_ContactNo,
		@User_Password,
		@User_Role,
		@City_ID,
		@State_ID
	)


	SET @User_ID = SCOPE_IDENTITY();


	insert into ServiceProviderDetails(
		User_ID,
		SP_Age ,
		SP_ShopAddress,
		SP_Service ,
		SP_Experience,
		SP_MinimumPrice,
		SP_AverageRating,
		Service_ID,
		Equipment_ID,
		SP_Status
	)
	values(
		@User_ID,
		@SP_Age,
		@SP_ShopAddress,
		@SP_Service,
		@SP_Experience,
		@SP_MinimumPrice,
		@SP_AverageRating,
		@Service_ID,
		@Equipment_ID,
		@SP_Status
	)

end
select * from ServiceProviderDetails
 
 Delete from UserDetails;
 Delete from ServiceProviderDetails;

alter proc Insert_User_Details
@User_Name varchar(50),
@User_EmailID varchar(100),
@User_Address varchar(200),
@User_ContactNo bigint,
@User_Password varchar(50),
@User_Role varchar(50),
@City_ID int
as
begin
	insert into UserDetails(
		User_Name,
		User_EmailID,
		User_Address,
		User_ContactNo,
		User_Password,
		User_Role,
		City_ID 
	)
	values(
		@User_Name,
		@User_EmailID,
		@User_Address,
		@User_ContactNo,
		@User_Password,
		@User_Role,
		@City_ID
	)
	select SCOPE_IDENTITY() as User_ID
end



---------------------------------------------------- not executed --------------------------------------------

--Update Worker Detail--
alter proc Update_Worker_Details
@SP_ID int,
@SP_Age int ,
@SP_ShopAddress varchar(200),
@SP_Service varchar(50),
@SP_Experience int,
@SP_Password varchar(50),
@SP_MinimumPrice int,
@SP_AverageRating int
as
begin
	update ServiceProviderDetails
	set SP_Age =@SP_Age,
		SP_ShopAddress=@SP_ShopAddress,
		SP_Service =@SP_Service,
		SP_Experience =@SP_Experience,
		SP_Password =@SP_Password,
		SP_MinimumPrice=@SP_MinimumPrice,
		SP_AverageRating=@SP_AverageRating
	where SP_ID=@SP_ID
end

--Delete Worker Detail--
create proc Delete_Worker_Details
@SP_ID int
as
begin
	delete from ServiceProviderDetails
	where SP_ID=@SP_ID;
end
---------------------------------------------------- not executed --------------------------------------------^
--Count total user--
create proc Count_ServiceProvider
as
begin
	select count(*) from ServiceProviderDetails
end
