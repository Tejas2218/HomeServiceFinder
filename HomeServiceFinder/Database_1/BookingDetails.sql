use Home_Service_Finder
go

select * from BookingDetails
go
-- 3-1-26 --Dev--
ALTER TABLE BookingDetails
ALTER COLUMN Time_Slot VARCHAR(50) NOT NULL;
go
--Insert Booking Detail--
CREATE OR ALTER PROCEDURE Insert_Booking_Details
    @Booking_Status varchar(50),
    @User_ID int,
    @SP_ID int,
    @Booking_Rating int,---- This will come after service completed    
    @Equipment_ID int,          -- Added missing parameter
    @Time_Slot varchar(50),     -- Added missing parameter
    @Visiting_DateTime datetime, -- Added missing parameter
    @Booking_Code varchar(6) =0
AS
BEGIN
    INSERT INTO BookingDetails
    (
        Booking_Status,
        User_ID,
        SP_ID,
        Equipment_ID,
        Time_Slot,
        Visiting_DateTime,
        Booking_Code
    )
    VALUES
    (
        @Booking_Status,
        @User_ID,
        @SP_ID,
        @Equipment_ID,
        @Time_Slot,
        @Visiting_DateTime,
        @Booking_Code
    )

    SELECT SCOPE_IDENTITY() as Booking_ID
END
GO

-- Testing Insert Procedure (Example)
exec Insert_Booking_Details 'Pending',6,5,16,'4-5','2026-01-06','122041'

delete from BookingDetails

select * from BookingDetails
select * from ServiceProviderDetails
select * from UserDetails
select * from EquipmentMaster
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
        b.Booking_Status,
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
    @User_ID int,
    @Booking_Status varchar(10)
AS 
BEGIN 
    Declare @SP_ID int
    Select @SP_ID=SP_ID from ServiceProviderDetails where User_ID = @User_ID
    IF(@Booking_Status = 'none')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID
        ORDER BY BD.Visiting_DateTime DESC
    END
    ELSE IF(@Booking_Status = 'Accepted')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status='Accepted'
        ORDER BY BD.Visiting_DateTime DESC
    END
    ELSE IF (@Booking_Status = 'Declined')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status='Declined'
        ORDER BY BD.Visiting_DateTime DESC
    END
    ELSE IF (@Booking_Status = 'Completed')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status='Completed'
        ORDER BY BD.Visiting_DateTime DESC
    END
    ELSE IF (@Booking_Status = 'Cancelled')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status='Cancelled' 
        ORDER BY BD.Visiting_DateTime DESC
    END
    ELSE IF(@Booking_Status = 'Upcomming')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status='Accepted' AND BD.Visiting_DateTime > cast(GETDATE() as Date)
        ORDER BY BD.Visiting_DateTime DESC
    END
    ELSE IF(@Booking_Status = 'Pending')
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status=@Booking_Status
        ORDER BY BD.Visiting_DateTime DESC
    END
    ELSE
    BEGIN
        SELECT * FROM BookingDetails AS BD 
        INNER JOIN UserDetails AS UD ON BD.User_ID=UD.User_ID 
        INNER JOIN EquipmentMaster AS EM ON BD.Equipment_ID = EM.Equipment_ID 
        WHERE BD.SP_ID=@SP_ID AND BD.Booking_Status='Accepted' AND BD.Visiting_DateTime = cast(GETDATE() as Date)
        ORDER BY BD.Visiting_DateTime DESC
    END
END

exec View_Booking_Details 7,'none'
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
    @User_ID int
AS 
BEGIN
    Declare @SP_ID int
    Select @SP_ID=SP_ID from ServiceProviderDetails where User_ID = @User_ID
    SELECT Count(*) as noti FROM BookingDetails WHERE SP_ID = @SP_ID  AND Booking_Status = 'Pending'; 
END
GO

-----------------Total booking Accept
CREATE OR ALTER PROCEDURE Total_Booking
    @User_ID int 
AS 
BEGIN
    Declare @SP_ID int
    Select @SP_ID=SP_ID from ServiceProviderDetails where User_ID = @User_ID
    SELECT Count(*) as Total FROM BookingDetails WHERE SP_ID = @SP_ID AND (Booking_Status = 'Accepted' or Booking_Status = 'Completed');
END
GO

-------------Avg rating of service provider
CREATE OR ALTER PROCEDURE Avg_Rating
    @SP_ID int 
AS 
BEGIN
    SET NOCOUNT ON;
    -- ISNULL ensures that even if the record is empty, you get a '0'
    SELECT ISNULL(SP_AverageRating, 0) AS SP_AverageRating 
    FROM ServiceProviderDetails 
    WHERE User_ID= @SP_ID
END

exec Avg_Rating 5

update ServiceProviderDetails set SP_AverageRating = 5 where SP_ID = 5
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
    @User_ID INT,
    @search varchar(50) = 'none' -- Increased size for better searching
AS
BEGIN
    Declare @SP_ID int
    Select @SP_ID = SP_ID from ServiceProviderDetails where User_ID = @User_ID

    -- If search is empty or 'none', show all
    IF(@search = 'none' OR @search = '')
    BEGIN
        SELECT U.User_ID, U.User_Name, U.User_EmailID, U.User_ContactNo 
        FROM BookingDetails B
        INNER JOIN UserDetails U ON B.User_ID = U.User_ID
        WHERE B.SP_ID = @SP_ID AND (B.Booking_Status = 'Accepted' or B.Booking_Status = 'Completed')
        GROUP BY U.User_ID, U.User_Name, U.User_EmailID, U.User_ContactNo
    END
    ELSE
    BEGIN
        SELECT U.User_ID, U.User_Name, U.User_EmailID, U.User_ContactNo 
        FROM BookingDetails B
        INNER JOIN UserDetails U ON B.User_ID = U.User_ID
        WHERE B.SP_ID = @SP_ID 
          AND (B.Booking_Status = 'Accepted' or B.Booking_Status = 'Completed') 
          -- Use LIKE for partial matching
          AND (U.User_Name LIKE '%' + @search + '%' OR U.User_EmailID LIKE '%' + @search + '%')
        GROUP BY U.User_ID, U.User_Name, U.User_EmailID, U.User_ContactNo
    END
END
exec Get_Unique_Customers_By_SP 5,'Tanmay'
select * from BookingDetails

update BookingDetails set Booking_Status = 'Pending' where Booking_ID = 5
GO

create or alter proc Fetch_BookingCode
@Booking_ID int
as 
begin
    Select * from BookingDetails where Booking_ID=@Booking_ID
end

GO

Create or alter proc Insert_Booking_DeclineReason
@Booking_ID int,
@Booking_Decline_Reason varchar(300)
as
begin
    update BookingDetails set Booking_Decline_Reason = @Booking_Decline_Reason where Booking_ID=@Booking_ID
end


Go
    
    Create or alter proc Fetch_User_Details
    @Booking_ID int
    as
    Begin
        select 
        UD.User_EmailID as User_EmailID,
        UD_SPD.User_EmailID as SP_EmailID,
        UD_SPD.User_Name as SP_Name,
        BD.Booking_Decline_Reason as Reason,
        BD.Visiting_DateTime as VisitingDate,
        BD.Time_Slot as TimeSlot
        from BookingDetails as BD inner join UserDetails as UD on BD.User_ID = UD.User_ID
        inner join ServiceProviderDetails as SPD on BD.SP_ID = SPD.SP_ID
        inner join UserDetails as UD_SPD on SPD.User_ID = UD_SPD.User_ID
        where BD.Booking_ID = @Booking_ID
    end


    exec Fetch_User_Details 8
GO

Create or alter proc Insert_Booking_Code
@Booking_ID int,
@Booking_Code varchar(300)
as
begin
    update BookingDetails set Booking_Code = @Booking_Code where Booking_ID=@Booking_ID
end

Go
    
    create or alter proc User_Cancle_Booking
@Booking_ID int
as
begin
    update BookingDetails
    SET Booking_Status = 'Cancelled'
    WHERE Booking_ID = @Booking_ID
    AND Booking_Status IN ('Pending', 'Accepted');
end


GO