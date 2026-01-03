use Home_Service_Finder
go

select * from BookingDetails
go
-- 3-1-26 --Dev--
ALTER TABLE BookingDetails
ALTER COLUMN Time_Slot VARCHAR(50) NOT NULL;
go
--Insert Booking Detail--
create or alter proc Insert_Booking_Details
@Booking_Status varchar(50),
@User_ID int,
@SP_ID int,
@Equipment_ID int,
@Time_Slot varchar(20)
as
begin
    insert into BookingDetails
    (
        Booking_Status,
        User_ID,
        SP_ID,
        Equipment_ID,
        Time_Slot,
        Visiting_DateTime
    )
    VALUES
    (
        @Booking_Status,
        @User_ID,
        @SP_ID,
        @Equipment_ID,
        @Time_Slot,
        GETDATE()
    )

    SELECT SCOPE_IDENTITY() as Booking_ID
END
GO

-- Testing Insert Procedure (Example)
-- exec Insert_Booking_Details 'Pending',14,7,4,1,'4-5', GETDATE()
GO

select * from BookingDetails
GO

select * from UserDetails
GO

select * from ServiceProviderDetails
GO

select * from EquipmentMaster

GO

--Update Booking Detail--
CREATE OR ALTER PROCEDURE Update_Booking_Details
    @Booking_ID int,
    @Booking_Status varchar(50),
    @User_ID int,
    @SP_ID int,
    @Booking_Rating int
AS
BEGIN
    UPDATE BookingDetails
    SET Booking_Status=@Booking_Status,
        User_ID=@User_ID,
        SP_ID=@SP_ID,
        Booking_Rating=@Booking_Rating
    WHERE Booking_ID=@Booking_ID
END
GO

-----------view booking for user side
CREATE OR ALTER PROCEDURE View_User_Booking_Details
    @User_ID INT
AS
BEGIN
    SELECT *
    FROM BookingDetails
    WHERE User_ID = @User_ID
END
GO

exec View_User_Booking_Details 10
GO

------------delete booking
CREATE OR ALTER PROCEDURE Delete_Booking_Details
    @Booking_ID int
AS
BEGIN
    DELETE FROM BookingDetails WHERE Booking_ID = @Booking_ID
END
GO

---------delete booking details (Fetch info before cancel)
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
GO

---------------view booking for service provider side 
CREATE OR ALTER PROCEDURE View_Booking_Details
    @SP_ID int,
    @Booking_Status varchar(10)
AS 
BEGIN 
    IF(@Booking_Status = 'none')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID
    END
    ELSE IF(@Booking_Status = 'Accepted')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status='Accept'
    END
    ELSE IF (@Booking_Status = 'Declined')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status='Decline'
    END
    ELSE
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status=@Booking_Status AND BD.Visiting_DateTime > GETDATE()
    END
END
GO

-----------------update booking status for service provider side
CREATE OR ALTER PROCEDURE Update_Booking_Status
    @Booking_ID int,
    @Booking_Status varchar(10)
AS 
BEGIN 
    UPDATE BookingDetails SET Booking_Status=@Booking_Status WHERE Booking_ID=@Booking_ID;
END
GO

select * from BookingDetails
GO

--------------------booking pending notification
CREATE OR ALTER PROCEDURE Notification_Pending_Booking
    @SP_ID int
AS 
BEGIN
    SELECT Count(*) as noti FROM BookingDetails WHERE SP_ID = @SP_ID  AND Booking_Status = 'Pending'; 
END
GO

-----------------Total booking Accept
CREATE OR ALTER PROCEDURE Total_Booking
    @SP_ID int 
AS 
BEGIN
    SELECT Count(*) as Total FROM BookingDetails WHERE SP_ID = @SP_ID AND Booking_Status = 'Accept';
END
GO

-------------Avg rating of service provider
CREATE OR ALTER PROCEDURE Avg_Rating
    @SP_ID int 
AS 
BEGIN
    SELECT SP_AverageRating FROM ServiceProviderDetails WHERE SP_ID = @SP_ID
END
GO

------------User Booking Records
CREATE OR ALTER PROCEDURE User_Booking_Records
    @User_ID int
AS 
BEGIN
    SELECT * FROM BookingDetails AS BD 
    INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
    WHERE BD.User_ID = @User_ID 
END
GO

----------service provider's customers fetch
CREATE OR ALTER PROCEDURE Get_Unique_Customers_By_SP
    @SP_ID INT,
    @search varchar(20) = 'none'
AS
BEGIN
    IF(@search = 'none')
    BEGIN
        SELECT
            U.User_ID, 
            U.User_Name,
            U.User_EmailID,
            U.User_ContactNo 
        FROM BookingDetails B
        INNER JOIN UserDetails U ON B.User_ID = U.User_ID
        INNER JOIN EquipmentMaster E ON B.Equipment_ID = E.Equipment_ID
        WHERE B.SP_ID = @SP_ID 
          AND B.Booking_Status = 'Accept' 
        GROUP BY 
            U.User_ID, 
            U.User_Name, 
            U.User_EmailID, 
            U.User_ContactNo
    END
    ELSE
    BEGIN
        SELECT
            U.User_ID, 
            U.User_Name,
            U.User_EmailID,
            U.User_ContactNo 
        FROM BookingDetails B
        INNER JOIN UserDetails U ON B.User_ID = U.User_ID
        INNER JOIN EquipmentMaster E ON B.Equipment_ID = E.Equipment_ID
        WHERE B.SP_ID = @SP_ID 
          AND B.Booking_Status = 'Accept' 
          AND (u.User_Name=@search OR u.User_EmailID=@search)
        GROUP BY 
            U.User_ID, 
            U.User_Name, 
            U.User_EmailID, 
            U.User_ContactNo
    END
END
GO