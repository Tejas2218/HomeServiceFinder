USE Home_Service_Finder
GO

--Display User Detail--
CREATE OR ALTER PROCEDURE Display_User_Details
AS
BEGIN
    SELECT * FROM UserDetails UD
    INNER JOIN CityDetails CD ON UD.City_ID = CD.City_ID
    LEFT JOIN StateDetails SD ON UD.State_ID = SD.State_ID
    WHERE User_Role = 'User'
END
GO

select * from UserDetails
GO

-- delete from UserDetails where User_ID=1
GO

--Display User Name Only--
CREATE OR ALTER PROCEDURE Display_User_Name
AS
BEGIN
    SELECT User_ID, User_Name FROM UserDetails WHERE User_Role = 'User'
END
GO

--Display Specific User Details--
CREATE OR ALTER PROCEDURE Display_User_Details_ByID
    @User_ID int
AS
BEGIN
    SELECT 
        UD.User_ID,
        UD.User_Name,
        UD.User_EmailID,
        UD.User_Address,
        UD.User_ContactNo,
        UD.User_Password,
        CD.City_Name,
        SD.State_Name
    FROM UserDetails UD
    INNER JOIN CityDetails CD ON UD.City_ID = CD.City_ID
    LEFT JOIN StateDetails SD ON UD.State_ID = SD.State_ID
    WHERE User_ID = @User_ID
END
GO

--Insert User Detail--
CREATE OR ALTER PROCEDURE Insert_User_Details
    @User_Name varchar(50),
    @User_EmailID varchar(100),
    @User_Address varchar(200),
    @User_ContactNo varchar(10),
    @User_Password varchar(50),
    @User_Role varchar(50),
    @City_Name varchar(50),
    @State_Name varchar(50)
AS
BEGIN
    DECLARE @City_ID int;
    SELECT @City_ID = City_ID FROM CityDetails WHERE City_Name = @City_Name

    DECLARE @State_ID int;
    SELECT @State_ID = State_ID FROM StateDetails WHERE State_Name = @State_Name

    INSERT INTO UserDetails(
        User_Name,
        User_EmailID,
        User_Address,
        User_ContactNo,
        User_Password,
        User_Role,
        City_ID,
        State_ID
    )
    VALUES(
        @User_Name,
        @User_EmailID,
        @User_Address,
        @User_ContactNo,
        @User_Password,
        @User_Role,
        @City_ID,
        @State_ID
    )
    SELECT SCOPE_IDENTITY() as User_ID
END
GO

-- Test Execution for Insert
-- exec Insert_User_Details 'Tanmay Adesara','t.adesara175@gmail.com','abcx ahshe ja  eeffef','9427396386','tanmay@123','User','Rajkot','Gujarat';
GO

--Update User Detail--
CREATE OR ALTER PROCEDURE Update_User_Details
    @User_ID int,
    @User_Name varchar(50),
    @User_EmailID varchar(100),
    @User_Address varchar(200),
    @User_ContactNo varchar(10), -- Changed from bigint to varchar to match Insert
    @User_Password varchar(50),
    @City_Name varchar(50),
    @State_Name varchar(50)
AS
BEGIN
    DECLARE @City_ID int;
    DECLARE @State_ID int;

    SELECT @City_ID = City_ID FROM CityDetails WHERE City_Name = @City_Name 
    SELECT @State_ID = State_ID FROM StateDetails WHERE State_Name = @State_Name 

    UPDATE UserDetails
    SET User_Name = @User_Name,
        User_EmailID = @User_EmailID,
        User_Address = @User_Address,
        User_ContactNo = @User_ContactNo,
        User_Password = @User_Password,
        City_ID = @City_ID,
        State_ID = @State_ID,
        Modified_DateTime = GETDATE()
    WHERE User_ID = @User_ID
END
GO