CREATE DATABASE hospital_management;


CREATE TABLE hospital_data (
    Hospital_Name VARCHAR(50),
    Location VARCHAR(50),
    Department VARCHAR(50),
    Doctors_Count INT,
    Patients_Count INT,
    Admission_Date DATE,
    Discharge_Date DATE,
    Medical_Expenses DECIMAL(10, 2)
);

SELECT * FROM hospital_data;

 -- 30 Days SQL Micro Course Certificate Assignment

-- 1.	Total Number of Patients
-- 	Write an SQL query to find the total number of patients across all hospitals.
	                    
		SELECT SUM(Patients_Count) AS Total_Patients
		FROM hospital_data;
		

-- 2.	Average Number of Doctors per Hospital
-- 	Retrieve the average count of doctors available in each hospital.
                 
		SELECT Hospital_Name, AVG(Doctors_Count) AS Avg_Doctors
		FROM hospital_data
		GROUP BY Hospital_Name;
	
-- 3.	Top 3 Departments with the Highest Number of Patients
-- 	Find the top 3 hospital departments that have the highest number of patients.
                     
		SELECT Department, SUM(Patients_Count) AS Total_Patients
		FROM hospital_data
		GROUP BY Department
		ORDER BY Total_Patients DESC
		LIMIT 3;

-- 4.	Hospital with the Maximum Medical Expenses
-- 	Identify the hospital that recorded the highest medical expenses.
                    
		SELECT * FROM hospital_data
		ORDER BY Medical_Expenses DESC    
			LIMIT 1;

-- 5.	Daily Average Medical Expenses
-- 	Calculate the average medical expenses per day for each hospital.
               
SELECT 
    Location AS Hospital_Name,
    AVG(Medical_Expenses / (Discharge_Date - Admission_Date + 1)) AS Average_Daily_Expenses
FROM hospital_data
WHERE Discharge_Date >= Admission_Date
GROUP BY Location
ORDER BY Average_Daily_Expenses DESC;



-- 6.	Longest Hospital Stay
-- 	Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
                   
		SELECT  * ,
		   (Discharge_Date - Admission_Date) AS Stay_Duration
			FROM hospital_data
			ORDER BY Stay_Duration DESC
			LIMIT 1;


-- 7.	Total Patients Treated Per City
-- 	Count the total number of patients treated in each city.
              
		SELECT Location AS City, SUM(Patients_Count) AS Total_Patients
		FROM hospital_data
		GROUP BY Location;


-- 8.	Average Length of Stay Per Department
-- 	Calculate the average number of days patients spend in each department.
                 
		SELECT Department, 
	     	  ROUND(AVG(Discharge_Date - Admission_Date), 2) AS Avg_Stay_Days
		FROM hospital_data
		GROUP BY Department;
		

-- 9.	Identify the Department with the Lowest Number of Patients
-- 	Find the department with the least number of patients.
                   
		SELECT Department, SUM(Patients_Count) AS Total_Patients
		FROM hospital_data
		GROUP BY Department
		ORDER BY Total_Patients ASC
		LIMIT 1;


-- 10.	 Monthly Medical Expenses Report
--       Group the data by month and calculate the total medical expenses for each month.
                 
		SELECT 
	    TO_CHAR(Admission_Date, 'YYYY-MM') AS Month,
	    SUM(Medical_Expenses) AS Total_Expenses
		FROM hospital_data
		GROUP BY Month
		ORDER BY Month;	

