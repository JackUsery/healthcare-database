
select * FROM healthcare_dataset;



-- find the total number of records
SELECT count(*) AS Record_count
FROM healthcare_dataset;

-- calculate the avrage age of patients
SELECT avg(Age) Average_age
FROM healthcare_dataset;

-- Alter Medical Condition name
alter table healthcare_dataset
rename column `Medical Condition` TO Medical_Condition; 

-- most frequent medical condition
SELECT Medical_Condition, count(*) AS Condition_Count
FROM healthcare_dataset
group by Medical_Condition
order by Condition_Count desc;


-- count of cancer patients and avg age of cancer patients
SELECT count(*) AS Cancer_count, avg(Age) AS Average_age
FROM healthcare_dataset
WHERE Medical_Condition = 'Cancer';

-- Total Billing Amount per Insurance Provider
select `Insurance Provider`, sum(`Billing Amount`) AS Total
FROM healthcare_dataset
group by `Insurance Provider`;

-- most frequent Blood Type
SELECT `Blood Type`, count(*) AS Blood_Type_Count
FROM healthcare_dataset
group by `Blood Type`
order by Blood_Type_Count desc;

-- counts the number of patients for each blood type where the medical condition is Cancer
SELECT `Blood Type`, count(*) AS Blood_Type_Count
FROM healthcare_dataset
WHERE Medical_Condition = 'Cancer'
group by `Blood Type`
order by Blood_Type_Count desc;

--  average billing amount for different admission types.
select `Admission Type`, avg(`Billing Amount`) AS Avg_Billing
FROM healthcare_dataset
group by `Admission Type`;

-- Top 3 Most Common Medications for Patients with Abnormal Test Results
select Medication, count(`Test Results`) AS Results_count
FROM healthcare_dataset
WHERE `Test Results` = 'Abnormal'
group by Medication
order by Results_count desc
limit 3;

-- Percentage of Emergency Admissions with Hypertension


