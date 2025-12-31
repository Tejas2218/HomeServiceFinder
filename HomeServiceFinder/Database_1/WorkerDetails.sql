--WorkerDetails--
---------------------------------------------------- not executed --------------------------------------------
--Display Worker Details--
create or alter proc Display_Worker_Details
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD  
	on SPD.User_ID=UD.User_ID 
		----25-12-25 Updated-----
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	inner join StateDetails SD
	on UD.State_ID=SD.State_ID
	inner join ServiceMaster SM
	on SPD.Service_ID=SM.Service_ID
	inner join EquipmentMaster EM
	on EM.Service_ID=SM.Service_ID
end
--26-12-25--
---Display Worker Details Pending--
create or alter proc Display_Worker_Details_Pending
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD  
	on SPD.User_ID=UD.User_ID 
		----25-12-25 Updated-----
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	inner join StateDetails SD
	on UD.State_ID=SD.State_ID
	inner join ServiceMaster SM
	on SPD.Service_ID=SM.Service_ID
	inner join EquipmentMaster EM
	on EM.Service_ID=SM.Service_ID
	where SPD.SP_Status='Pending'
end

--26-12-25--
---Display Worker Details Approved--
create or alter proc Display_Worker_Details_Approved
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD  
	on SPD.User_ID=UD.User_ID 
		----25-12-25 Updated-----
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	inner join StateDetails SD
	on UD.State_ID=SD.State_ID
	inner join ServiceMaster SM
	on SPD.Service_ID=SM.Service_ID
	inner join EquipmentMaster EM
	on EM.Service_ID=SM.Service_ID
	where SPD.SP_Status='Approved'
end


--26-12-25--
---Display Worker Details Decline--
create or alter proc Display_Worker_Details_Decline
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD  
	on SPD.User_ID=UD.User_ID 
		----25-12-25 Updated-----
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	inner join StateDetails SD
	on UD.State_ID=SD.State_ID
	inner join ServiceMaster SM
	on SPD.Service_ID=SM.Service_ID
	inner join EquipmentMaster EM
	on EM.Service_ID=SM.Service_ID
	where SPD.SP_Status='Rejected'
end



--Display Worker Detail by Service--
create or alter proc Display_Worker_Details_ByService
@SP_ID int
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD 
	on SPD.User_ID=UD.User_ID  
	----25-12-25 Updated-----
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	inner join StateDetails SD
	on UD.State_ID=SD.State_ID
	inner join ServiceMaster SM
	on SM.Service_ID=SPD.Service_ID
	inner join EquipmentMaster EM
	on EM.Service_ID=SM.Service_ID
	where SPD.Service_ID=@SP_ID
end

--Display Worker Detail by Equipment--
create or alter proc Display_Worker_Details_ByEquipment
@EQ_ID int
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD 
	on SPD.User_ID=UD.User_ID  
	----25-12-25 Updated-----
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	inner join StateDetails SD
	on UD.State_ID=SD.State_ID
	inner join ServiceMaster SM
	on SM.Service_ID=SPD.Service_ID
	inner join EquipmentMaster EM
	on EM.Service_ID=SM.Service_ID
	where SPD.Equipment_ID=@EQ_ID
end
exec Display_Worker_Details_ByEquipment 1

exec Display_Worker_Details_ByService 9
select * from ServiceProviderDetails

exec Display_Worker_Details_ByID 4

--Display Specific Worker Details--
create or alter proc Display_Worker_Details_ByID
@SP_ID int
as
begin
	select * from ServiceProviderDetails SPD 
	inner join UserDetails UD 
	on SPD.User_ID=UD.User_ID 
	----25-12-25 Updated-----
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	inner join StateDetails SD
	on UD.State_ID=SD.State_ID
	inner join ServiceMaster SM
	on SM.Service_ID=SPD.Service_ID
	inner join EquipmentMaster EM
	on EM.Service_ID=SM.Service_ID
	where SPD.SP_ID=@SP_ID
end

---------------------------------------------------- not executed --------------------------------------------^

alter table ServiceProviderDetails drop column SP_Service 
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
		@SP_Experience,
		@SP_MinimumPrice,
		@SP_AverageRating,
		@Service_ID,
		@Equipment_ID,
		@SP_Status
	)

end

---------------------------------------------------- not executed --------------------------------------------

--Update Worker Detail--
create or alter proc Update_Worker_Details
@SP_ID int,
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
@SP_Experience int,
@SP_MinimumPrice int
as
begin
	update ServiceProviderDetails
	set Service_ID=@Service_ID,
		Equipment_ID=@Equipment_ID,
		SP_Age=@SP_Age,
		SP_Experience=@SP_Experience,
		SP_MinimumPrice=@SP_MinimumPrice,
		SP_ShopAddress=@SP_ShopAddress
	where SP_ID=@SP_ID

	declare @User_ID int;
	select @User_ID=User_ID from ServiceProviderDetails
	where SP_ID=@SP_ID

	update UserDetails
	set User_Name=@User_Name,
		User_EmailID=@User_EmailID,
		User_ContactNo=@User_ContactNo,
		State_ID=@State_ID,
		City_ID=@City_ID,
		User_Address=@User_Address,
		User_Password=@User_Password
	where User_ID=@User_ID
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

--Update Worker Status--  25-12-25
create or alter proc Update_Worker_Status
@SP_ID int,
@SP_Status varchar(50)
as
begin
	declare @User_ID int;

	select @User_ID=User_ID from ServiceProviderDetails 
	where SP_ID=@SP_ID

	update ServiceProviderDetails
	set SP_Status=@SP_Status
	where SP_ID=@SP_ID

	update UserDetails
	set Modified_DateTime=GETDATE()
	where User_ID=@User_ID
end

