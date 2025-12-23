--State Details--
--Display State--
create or alter proc Display_State
as
begin
	select * from StateDetails
end

--Display City--
create or alter proc Display_City
@State_Name varchar(50)
as
begin
	declare @State_ID int;
	select @State_ID=State_ID from StateDetails where State_Name=@State_Name
	select * from CityDetails where State_ID=@State_ID
end
SELECT * FROM CityDetails;

--Insert State--
create proc Insert_State
@State_Name varchar(50)
as
begin
	Insert into StateDetails(State_Name)
	values(@State_Name)
end

--Insert State--
Insert into StateDetails(State_Name)
values('Gujarat'),
	  ('Maharashtra'),
	  ('Rajasthan'),
	  ('Madhya Pradesh'),
	  ('Kerela'),
	  ('Aandhra Pradesh'),
	  ('Uttar Pradesh'),
	  ('Chhatishgarha'),
	  ('Tamilnadu'),
	  ('Panjab'),
	  ('Hariyana'),
	  ('Aasam'),
	  ('Arunachal Pradesh'),
	  ('Meghalay'),
	  ('Mizoram'),
	  ('Manipur'),
	  ('Nagaland'),
	  ('Jharkhand')
select * from StateDetails

--Insert City--
insert into CityDetails(State_ID,City_Name)
values(1,'Bhuj'),
	(1, 'Ahmedabad'),
	(1, 'Surat'),
	(1, 'Rajkot'),
	(1, 'Vadodara'),
	(1, 'Gandhinagar'),
	(1, 'Morbi'),
	(1, 'Jamnagar'),
	(1, 'Nadiad'),
	(1, 'Anand'),
	(1, 'Vapi'),
	(1, 'Mehsana'),
	(6, 'Visakhapatnam'),
	(6, 'Vijayawada'),
	(6, 'Guntur'),
	(6, 'Nellore'),
	(6, 'Kurnool'),
	(6, 'Tirupati'),
	(6, 'Rajahmundry'),
	(6, 'Kakinada'),
	(6, 'Kadapa'),
	(6, 'Anantapur'),
	(12, 'Guwahati'),
	(12, 'Silchar'),
	(12, 'Dibrugarh'),
	(12, 'Jorhat'),
	(12, 'Tinsukia'),
	(12, 'Tezpur'),
	(12, 'Nagaon'),
	(12, 'Bongaigaon'),
	(12, 'Sivasagar'),
	(12, 'Karimganj'),
	(13, 'Itanagar'),
	(13, 'Tawang'),
	(13, 'Ziro'),
	(13, 'Bomdila'),
	(13, 'Pasighat'),
	(13, 'Naharlagun'),
	(13, 'Roing'),
	(13, 'Aalo'),
	(13, 'Tezu'),
	(13, 'Namsai'),
	(8, 'Raipur'),
	(8, 'Bhilai'),
	(8, 'Durg'),
	(8, 'Bilaspur'),
	(8, 'Korba'),
	(8, 'Rajnandgaon'),
	(8, 'Jagdalpur'),
	(8, 'Raigarh'),
	(8, 'Ambikapur'),
	(8, 'Dhamtari'),
	(11, 'Gurugram'),
	(11, 'Faridabad'),
	(11, 'Hisar'),
	(11, 'Panipat'),
	(11, 'Karnal'),
	(11, 'Sonipat'),
	(11, 'Rohtak'),
	(11, 'Yamunanagar'),
	(11, 'Ambala'),
	(11, 'Panchkula'),
	(18, 'Ranchi'),
	(18, 'Jamshedpur'),
	(18, 'Dhanbad'),
	(18, 'Bokaro Steel City'),
	(18, 'Hazaribagh'),
	(18, 'Deoghar'),
	(18, 'Giridih'),
	(18, 'Ramgarh'),
	(18, 'Chaibasa'),
	(18, 'Phusro'),
	(5, 'Thiruvananthapuram'),
	(5, 'Kochi'),
	(5, 'Kozhikode'),
	(5, 'Thrissur'),
	(5, 'Kollam'),
	(5, 'Alappuzha'),
	(5, 'Palakkad'),
	(5, 'Malappuram'),
	(5, 'Kannur'),
	(5, 'Kottayam'),
	(4, 'Bhopal'),
	(4, 'Indore'),
	(4, 'Gwalior'),
	(4, 'Jabalpur'),
	(4, 'Ujjain'),
	(4, 'Sagar'),
	(4, 'Ratlam'),
	(4, 'Rewa'),
	(4, 'Satna'),
	(4, 'Dewas'),
	(2, 'Mumbai'),
	(2, 'Pune'),
	(2, 'Nagpur'),
	(2, 'Nashik'),
	(2, 'Thane'),
	(2, 'Aurangabad'),
	(2, 'Solapur'),
	(2, 'Amravati'),
	(2, 'Kolhapur'),
	(2, 'Jalgaon'),
	(16, 'Imphal'),
	(16, 'Thoubal'),
	(16, 'Kakching'),
	(16, 'Churachandpur'),
	(16, 'Ukhrul'),
	(16, 'Bishnupur'),
	(16, 'Senapati'),
	(16, 'Jiribam'),
	(16, 'Tamenglong'),
	(16, 'Chandel'),
	(14, 'Shillong'),
	(14, 'Tura'),
	(14, 'Nongpoh'),
	(14, 'Jowai'),
	(14, 'Baghmara'),
	(14, 'Williamnagar'),
	(14, 'Mairang'),
	(14, 'Resubelpara'),
	(14, 'Sohra'),
	(14, 'Khliehriat'),
	(15, 'Aizawl'),
	(15, 'Lunglei'),
	(15, 'Saiha'),
	(15, 'Champhai'),
	(15, 'Kolasib'),
	(15, 'Serchhip'),
	(15, 'Lawngtlai'),
	(15, 'Mamit'),
	(15, 'Hnahthial'),
	(15, 'Saitual'),
	(17, 'Kohima'),
	(17, 'Dimapur'),
	(17, 'Mokokchung'),
	(17, 'Tuensang'),
	(17, 'Wokha'),
	(17, 'Zunheboto'),
	(17, 'Mon'),
	(17, 'Phek'),
	(17, 'Kiphire'),
	(17, 'Longleng'),
	(10, 'Ludhiana'),
	(10, 'Amritsar'),
	(10, 'Jalandhar'),
	(10, 'Patiala'),
	(10, 'Bathinda'),
	(10, 'Mohali'),
	(10, 'Hoshiarpur'),
	(10, 'Pathankot'),
	(10, 'Moga'),
	(10, 'Firozpur'),
	(3, 'Jaipur'),
	(3, 'Jodhpur'),
	(3, 'Udaipur'),
	(3, 'Kota'),
	(3, 'Ajmer'),
	(3, 'Bikaner'),
	(3, 'Alwar'),
	(3, 'Bharatpur'),
	(3, 'Sikar'),
	(3, 'Pali'),
	(9, 'Chennai'),
	(9, 'Coimbatore'),
	(9, 'Madurai'),
	(9, 'Tiruchirappalli'),
	(9, 'Tiruppur'),
	(9, 'Salem'),
	(9, 'Erode'),
	(9, 'Vellore'),
	(9, 'Thoothukudi'),
	(9, 'Dindigul'),
	(7, 'Lucknow'),
	(7, 'Kanpur'),
	(7, 'Varanasi'),
	(7, 'Agra'),
	(7, 'Meerut'),
	(7, 'Prayagraj'),
	(7, 'Ghaziabad'),
	(7, 'Noida'),
	(7, 'Bareilly'),
	(7, 'Aligarh')

select * from CityDetails where State_ID=1










--Insert City--
create proc Insert_City
@State_ID int,
@City_Name varchar(50)
as
begin
	Insert into CityDetails(State_ID,City_Name)
	values(@State_ID,@City_Name)
end

