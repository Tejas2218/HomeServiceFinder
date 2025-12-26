--UserDetails--
--Displa User Detail--
create or alter proc Display_User_Details
as
begin
	select * from UserDetails UD
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	left join StateDetails SD
	on UD.State_ID=SD.State_ID
	where User_Role='User'
end

--Display Specific User Details--
create or alter proc Display_User_Details_ByID
@User_ID int
as
begin
	select 
	UD.User_ID,
        UD.User_Name,
        UD.User_EmailID,
        UD.User_Address,
        UD.User_ContactNo,
        UD.User_Password,
        CD.City_Name,
        SD.State_Name
	from UserDetails UD
	inner join CityDetails CD
	on UD.City_ID=CD.City_ID
	left join StateDetails SD
	on UD.State_ID=SD.State_ID
	where User_ID=@User_ID
end

--Insert User Detail--
create or alter proc Insert_User_Details
@User_Name varchar(50),
@User_EmailID varchar(100) ,
@User_Address varchar(200),
@User_ContactNo bigint,
@User_Password varchar(50),
@User_Role varchar(50),
@City_Name varchar(50),
@State_Name varchar(50)
as
begin
	declare @City_ID int;
	select @City_ID= City_ID from CityDetails where City_Name=@City_Name

	declare @State_ID int;
	select @State_ID= State_ID from StateDetails where State_Name=@State_Name
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
	select SCOPE_IDENTITY() as User_ID
end

--Update User Detail--
create or alter proc Update_User_Details
@User_ID int,
@User_Name varchar(50),
@User_EmailID varchar(100),
@User_Address varchar(200),
@User_ContactNo bigint,
@User_Password varchar(50),
@City_Name varchar(50),
@State_Name varchar(50)
as
begin
	declare @City_ID int;
	declare @State_ID int;
	select @City_ID=City_ID from CityDetails where City_Name=@City_Name 
	select @State_ID=State_ID from StateDetails where State_Name=@State_Name 
	update UserDetails
	set User_Name=@User_Name,
		User_EmailID=@User_EmailID,
		User_Address=@User_Address,
		User_ContactNo=@User_ContactNo,
		User_Password=@User_Password,
		City_ID=@City_ID,
		State_ID=@State_ID,
		Modified_DateTime = GETDATE()
	where User_ID=@User_ID
end

--Delete User Details--
create proc Delete_User_Details
@User_ID int
as
begin
	delete from UserDetails
	where User_ID=@User_ID;
end

--Count total user--
create or alter proc Count_User
as
begin
	select count(*) from UserDetails 
	where User_Role='User'
end


