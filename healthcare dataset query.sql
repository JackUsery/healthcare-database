-- DATA PREPARATION
RENAME TABLE healthcare_dataset.healthcare_dataset TO Patients;

select *
FROM Patients;

-- find the total number of records
SELECT
    count(*) AS Record_count
FROM
    Patients;
-- Alter Medical Condition name
alter table Patients
rename column `Medical Condition` TO Medical_Condition;

-- ALTER blood type name
ALTER TABLE Patients
rename column `Blood Type` TO Blood_Type;

-- ALTER Admission Type name
ALTER TABLE Patients
rename column `Admission Type` TO Admission_Type;

-- ALTER Insurance Provider name
ALTER TABLE Patients
rename column `Insurance Provider` TO Insurance_Provider;

-- ALTER Billing Amount name
ALTER TABLE Patients
rename column `Billing Amount` TO Billing_Amount;

-- ALTER Test Results name
ALTER TABLE Patients
rename column `Test Results` TO Test_Results;

-- ALTER room number name
ALTER TABLE Patients
rename column `Room Number` TO Room_Number;

-- ALTER discharge date name
ALTER TABLE Patients
rename column `Discharge Date` TO Discharge_Date;

-- ALTER DATE OF ADMISSION name
ALTER TABLE Patients
rename column `Date of Admission` TO Date_of_Admission;

-- ALTER Billing_Amount
ALTER TABLE Patients MODIFY COLUMN Billing_Amount DECIMAL(10, 2);

-- MODIFY NAME
ALTER TABLE Patients MODIFY COLUMN Name VARCHAR(50);

-- MODIFY GENGER
ALTER TABLE Patients MODIFY COLUMN Gender VARCHAR(10);

-- MODIFY BLOOD TYPE
ALTER TABLE Patients MODIFY COLUMN Blood_Type CHAR(3);

-- MODIFY MEDICAL CONDITION
ALTER TABLE Patients MODIFY COLUMN Medical_Condition VARCHAR(50);

-- MODIFY Doctor
ALTER TABLE Patients MODIFY COLUMN Doctor VARCHAR(50);

-- MODIFY Hospital
ALTER TABLE Patients MODIFY COLUMN Hospital VARCHAR(100);

-- MODIFY Insurance Provider
ALTER TABLE Patients MODIFY COLUMN Insurance_Provider VARCHAR(50);

-- MODIFY Admission type
ALTER TABLE Patients MODIFY COLUMN Admission_Type VARCHAR(50);

-- MODIFY Medication
ALTER TABLE Patients MODIFY COLUMN Medication VARCHAR(50);

-- MODIFY Test Results
ALTER TABLE Patients MODIFY COLUMN Test_Results VARCHAR(50);

-- MODIFY date of admission
ALTER TABLE Patients 
MODIFY COLUMN Date_of_Admission DATE;

-- MODIFY discharge date
ALTER TABLE Patients 
MODIFY COLUMN Discharge_Date DATE;

---------------------------------------------
-- DATA ANALYSIS

-- calculate the avrage age of patients
SELECT avg(Age) Average_age
FROM Patients;

-- total number of male and female admitted
SELECT Gender, COUNT(*) AS Gender_count
FROM Patients
GROUP BY Gender;

-- most frequent medical condition
SELECT Medical_Condition count(*) AS Condition_Count
FROM Patients
group by Medical_Condition
order by Condition_Count desc;

-- avg age of patients ammited for elective surgery
SELECT Admission_Type avg(Age) AS Average_age
FROM Patients
WHERE Admission_Type = 'elective';

-- count of patients admitted for elective surgery and avg age of patients admitted for elective surgery
SELECT Admission_Type, COUNT(Admission_Type) AS Admission_Type_count avg(Age) AS Average_age
FROM Patients
WHERE Admission_Type = 'elective';

-- count of cancer patients and avg age of cancer patients
SELECT count(*) AS Cancer_count avg(Age) AS Average_age
FROM Patients
WHERE Medical_Condition = 'Cancer';

-- Total Billing Amount per Insurance Provider
select Insurance_Provider sum(Billing_Amount) AS Total
FROM Patients
group by Insurance_Provider;

--  average billing amount for different admission types.
select Admission_Type, avg(Billing_Amount) AS Avg_Billing
FROM Patients
group by Admission_Type;

-- most frequent Blood Type
SELECT Blood_Type, count(*) AS Blood_Type_Count
FROM Patients
group by Blood_Type
order by Blood_Type_Count desc;

-- counts the number of patients for each blood type where the medical condition is Cancer
SELECT Blood_Type, count(*) AS Blood_Type_Count
FROM Patients
WHERE Medical_Condition = 'cancer'
group by Blood_Type
order by Blood_Type_Count desc;

-- Top 3 Most Common Medications for Patients with Abnormal Test Results
select Medication, count(Test_Results) AS Results_count
FROM Patients
WHERE Test_Results = 'Abnormal'
group by Medication
order by Results_count desc;
limit 3;

-- LENGTH OF STAY
SELECT Name, Date_of_Admission, Discharge_Date, DATEDIFF(Date_of_Admission, Discharge_Date) AS Length_of_Stay
FROM Patients;

-- Average Length of Stay
SELECT AVG(DATEDIFF(Date_of_Admission, Discharge_Date)) AS Average_Length_of_Stay
FROM Patients;

