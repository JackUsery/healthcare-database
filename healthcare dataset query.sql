RENAME TABLE healthcare_dataset.healthcare_dataset TO Patients;

select
    *
FROM
    Patients;

-- find the total number of records
SELECT
    count(*) AS Record_count
FROM
    Patients;

-- calculate the avrage age of patients
SELECT
    avg(Age) Average_age
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

-- most frequent medical condition
SELECT
    Medical_Condition,
    count(*) AS Condition_Count
FROM
    Patients
group by
    Medical_Condition
order by
    Condition_Count desc;

-- count of cancer patients and avg age of cancer patients
SELECT
    count(*) AS Cancer_count,
    avg(Age) AS Average_age
FROM
    Patients
WHERE
    Medical_Condition = 'Cancer';

-- Total Billing Amount per Insurance Provider
select
    Insurance_Provider,
    sum(Billing_Amount) AS Total
FROM
    Patients
group by
    Insurance_Provider;

-- most frequent Blood Type
SELECT
    Blood_Type,
    count(*) AS Blood_Type_Count
FROM
    Patients
group by
    Blood_Type
order by
    Blood_Type_Count desc;

-- counts the number of patients for each blood type where the medical condition is Cancer
SELECT
    Blood_Type,
    count(*) AS Blood_Type_Count
FROM
    Patients
WHERE
    Medical_Condition = 'Cancer'
group by
    Blood_Type
order by
    Blood_Type_Count desc;

--  average billing amount for different admission types.
select
    Admission_Type,
    avg(Billing_Amount) AS Avg_Billing
FROM
    Patients
group by
    Admission_Type;

-- Top 3 Most Common Medications for Patients with Abnormal Test Results
select
    Medication,
    count(Test_Results) AS Results_count
FROM
    Patients
WHERE
    Test_Results = 'Abnormal'
group by
    Medication
order by
    Results_count desc
limit
    3;

-- Percentage of Emergency Admissions with Hypertension