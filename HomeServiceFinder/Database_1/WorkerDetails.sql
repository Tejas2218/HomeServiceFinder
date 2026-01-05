USE Home_Service_Finder
GO

--Display Worker Details--
CREATE OR ALTER PROCEDURE Display_Worker_Details
AS
BEGIN
    SELECT * FROM ServiceProviderDetails SPD 
    INNER JOIN UserDetails UD  
        ON SPD.User_ID = UD.User_ID 
    INNER JOIN CityDetails CD
        ON UD.City_ID = CD.City_ID
    INNER JOIN StateDetails SD
        ON UD.State_ID = SD.State_ID
    INNER JOIN ServiceMaster SM
        ON SPD.Service_ID = SM.Service_ID
    INNER JOIN EquipmentMaster EM
        ON EM.Equipment_ID = SPD.Equipment_ID
END
GO

--Display Worker Details Pending--
CREATE OR ALTER PROCEDURE Display_Worker_Details_Pending
AS
BEGIN
    SELECT * FROM ServiceProviderDetails SPD 
    INNER JOIN UserDetails UD  
        ON SPD.User_ID = UD.User_ID 
    INNER JOIN CityDetails CD
        ON UD.City_ID = CD.City_ID
    INNER JOIN StateDetails SD
        ON UD.State_ID = SD.State_ID
    INNER JOIN ServiceMaster SM
        ON SPD.Service_ID = SM.Service_ID
    INNER JOIN EquipmentMaster EM
        ON EM.Service_ID = SM.Service_ID
    WHERE SPD.SP_Status = 'Pending'
END
GO

--Display Worker Details Approved--
CREATE OR ALTER PROCEDURE Display_Worker_Details_Approved
AS
BEGIN
    SELECT * FROM ServiceProviderDetails SPD 
    INNER JOIN UserDetails UD  
        ON SPD.User_ID = UD.User_ID 
    INNER JOIN CityDetails CD
        ON UD.City_ID = CD.City_ID
    INNER JOIN StateDetails SD
        ON UD.State_ID = SD.State_ID
    INNER JOIN ServiceMaster SM
        ON SPD.Service_ID = SM.Service_ID
    INNER JOIN EquipmentMaster EM
        ON EM.Service_ID = SM.Service_ID
    WHERE SPD.SP_Status = 'Approved'
END
GO

--Display Worker Details Decline--
CREATE OR ALTER PROCEDURE Display_Worker_Details_Decline
AS
BEGIN
    SELECT * FROM ServiceProviderDetails SPD 
    INNER JOIN UserDetails UD  
        ON SPD.User_ID = UD.User_ID 
    INNER JOIN CityDetails CD
        ON UD.City_ID = CD.City_ID
    INNER JOIN StateDetails SD
        ON UD.State_ID = SD.State_ID
    INNER JOIN ServiceMaster SM
        ON SPD.Service_ID = SM.Service_ID
    INNER JOIN EquipmentMaster EM
        ON EM.Service_ID = SM.Service_ID
    WHERE SPD.SP_Status = 'Rejected'
END
GO

--Display Worker Detail by Service--
CREATE OR ALTER PROCEDURE Display_Worker_Details_ByService
@Service_ID int
AS
BEGIN
    SELECT * FROM ServiceProviderDetails SPD 
    INNER JOIN UserDetails UD 
        ON SPD.User_ID = UD.User_ID  
    INNER JOIN CityDetails CD
        ON UD.City_ID = CD.City_ID
    INNER JOIN StateDetails SD
        ON UD.State_ID = SD.State_ID
    INNER JOIN ServiceMaster SM
        ON SM.Service_ID = SPD.Service_ID
    INNER JOIN EquipmentMaster EM
        ON EM.Service_ID = SM.Service_ID
    WHERE SPD.Service_ID = @Service_ID
END
GO

--Display Worker Detail by Equipment--
CREATE OR ALTER PROCEDURE Display_Worker_Details_ByEquipment
@Equipment_ID int
AS
BEGIN
    SELECT * FROM ServiceProviderDetails SPD 
    INNER JOIN UserDetails UD 
        ON SPD.User_ID = UD.User_ID  
    INNER JOIN CityDetails CD
        ON UD.City_ID = CD.City_ID
    INNER JOIN StateDetails SD
        ON UD.State_ID = SD.State_ID
    INNER JOIN ServiceMaster SM
        ON SM.Service_ID = SPD.Service_ID
    INNER JOIN EquipmentMaster EM
        ON EM.Equipment_ID = SPD.Equipment_ID
    WHERE SPD.Equipment_ID=@Equipment_ID
END
GO

---exec Display_Worker_Details_ByEquipment 16
-- exec Display_Worker_Details_ByService 9
-- exec Display_Worker_Details_ByID 12
GO

--Display Specific Worker Details--
CREATE OR ALTER PROCEDURE Display_Worker_Details_ByID
@SP_ID int
AS
BEGIN
    SELECT * FROM ServiceProviderDetails SPD 
    INNER JOIN UserDetails UD 
        ON SPD.User_ID = UD.User_ID 
    INNER JOIN CityDetails CD
        ON UD.City_ID = CD.City_ID
    INNER JOIN StateDetails SD
        ON UD.State_ID = SD.State_ID
    INNER JOIN ServiceMaster SM
        ON SM.Service_ID = SPD.Service_ID
    INNER JOIN EquipmentMaster EM
        ON EM.Equipment_ID = SPD.Equipment_ID
    WHERE SPD.User_ID = @SP_ID
END
exec Display_Worker_Details_ByID 5
select * from ServiceProviderDetails
GO

--Insert Worker Detail--
CREATE OR ALTER PROCEDURE Insert_Worker_Details
    @User_Name varchar(50),
    @User_EmailID varchar(100),
    @User_Address varchar(200),
    @User_ContactNo varchar(10),
    @User_Password varchar(50),
    @User_Role varchar(50),
    @City_ID int,
    @State_ID int,
    @Service_ID int,
    @Equipment_ID int,
    @SP_Age int,
    @SP_ShopAddress varchar(200),
    @SP_Experience int,
    @SP_MinimumPrice int,
    @SP_AverageRating int,
    @SP_Status varchar(20)
AS
BEGIN
    DECLARE @User_ID INT;

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

    SET @User_ID = SCOPE_IDENTITY();

    INSERT INTO ServiceProviderDetails(
        User_ID,
        SP_Age,
        SP_ShopAddress,
        SP_Experience,
        SP_MinimumPrice,
        SP_AverageRating,
        Service_ID,
        Equipment_ID,
        SP_Status
    )
    VALUES(
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
END
GO

--Update Worker Detail--
-- I have added the missing parameters (Service_ID, Equipment_ID, User details) to make this valid --
CREATE OR ALTER PROCEDURE Update_Worker_Details
    @SP_ID int,
    @SP_Age int,
    @SP_ShopAddress varchar(200),
    @SP_Experience int,
    @SP_MinimumPrice int,
    @Service_ID int,          -- Added
    @Equipment_ID int,        -- Added
    @User_Name varchar(50),   -- Added
    @User_EmailID varchar(100), -- Added
    @User_Address varchar(200), -- Added
    @User_ContactNo varchar(10), -- Added
    @User_Password varchar(50), -- Added
    @City_ID int,             -- Added
    @State_ID int             -- Added
AS
BEGIN
    -- Update Service Provider specific details
    UPDATE ServiceProviderDetails
    SET Service_ID = @Service_ID,
        Equipment_ID = @Equipment_ID,
        SP_Age = @SP_Age,
        SP_Experience = @SP_Experience,
        SP_MinimumPrice = @SP_MinimumPrice,
        SP_ShopAddress = @SP_ShopAddress
    WHERE SP_ID = @SP_ID

    -- Get the User_ID associated with this SP_ID
    DECLARE @User_ID int;
    SELECT @User_ID = User_ID FROM ServiceProviderDetails
    WHERE SP_ID = @SP_ID

    -- Update the User table details
    UPDATE UserDetails
    SET User_Name = @User_Name,
        User_EmailID = @User_EmailID,
        User_ContactNo = @User_ContactNo,
        State_ID = @State_ID,
        City_ID = @City_ID,
        User_Address = @User_Address,
        User_Password = @User_Password,
        Modified_DateTime = GETDATE()
    WHERE User_ID = @User_ID
END
GO

--Delete Worker Detail--
CREATE OR ALTER PROCEDURE Delete_Worker_Details
    @SP_ID int
AS
BEGIN
    -- Optional: Delete from UserDetails as well if you want strict cleanup
    -- For now, deleting from ServiceProviderDetails as requested
    DELETE FROM ServiceProviderDetails
    WHERE SP_ID = @SP_ID;
END
GO

--Count total service providers--
CREATE OR ALTER PROCEDURE Count_ALL_ServiceProvider
AS
BEGIN
    SELECT count(*) FROM ServiceProviderDetails
END
GO

--Update Worker Status--
CREATE OR ALTER PROCEDURE Update_Worker_Status
    @SP_ID int,
    @SP_Status varchar(50)
AS
BEGIN
    DECLARE @User_ID int;

    SELECT @User_ID = User_ID FROM ServiceProviderDetails 
    WHERE SP_ID = @SP_ID

    UPDATE ServiceProviderDetails
    SET SP_Status = @SP_Status
    WHERE SP_ID = @SP_ID

    UPDATE UserDetails
    SET Modified_DateTime = GETDATE()
    WHERE User_ID = @User_ID
END
GO

-------------------------service master view top3
GO
create or alter proc View_ServiceMasterTop3
as
Begin
Select TOP 3 * from ServiceMaster
end
Go

-----------get provider email
create or alter proc Get_Provider_Email 
@SP_ID int
as 
begin
    Select UD.User_EmailID as EmailID from ServiceProviderDetails as SPD inner join UserDetails as UD on SPD.User_ID = UD.User_ID where SPD.SP_ID = @SP_ID
end
