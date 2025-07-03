# SQL-Hospital-Data-Analysis
# 🏥 Hospital Data Analysis - SQL Project 📊

This is a comprehensive SQL case study that analyzes hospital management data across multiple healthcare facilities. The project covers data analysis, patient management insights, and healthcare operational metrics using SQL.

## 🗃️ Project Info

- **Database Name**: `hospital_management`
- **Table Name**: `hospital_data`
- **Level**: Intermediate
- **Tools**: SQL (PostgreSQL)
- **Duration**: 30 Days SQL Micro Course

## 🛠️ Project Structure 🎯

1. **Database Setup**: Set up and structure a hospital management database
2. **Data Analysis**: Perform comprehensive analysis of patient, doctor, and expense data
3. **Healthcare Insights**: Extract meaningful patterns from hospital operations
4. **Business Intelligence**: Answer critical healthcare management questions
5. **Generate actionable insights for hospital administration**

## 📁 Project Overview

- **Database Setup & Table Creation**
- **Patient Management Analysis**
- **Resource Allocation Insights**
- **Financial Performance Metrics**
- **Operational Efficiency Reports**

## 🛠️ 1. Database Setup

**🗃️ Create Database**: The project begins by creating a database named `hospital_management`.

```sql
    CREATE DATABASE hospital_management;
```

**📦 Create Table**: A table named `hospital_data` is created to store comprehensive hospital information.

```sql
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
```

## 🔍 2. Data Analysis & Business Questions

### 📊 Patient Management Analysis

#### 1. **Total Number of Patients**
*Objective*: Write an SQL query to find the total number of patients across all hospitals.

```sql
    SELECT SUM(Patients_Count) AS Total_Patients
    FROM hospital_data;
```

#### 2. **Average Number of Doctors per Hospital**
*Objective*: Retrieve the average count of doctors available in each hospital.

```sql
      SELECT Hospital_Name, AVG(Doctors_Count) AS Avg_Doctors
  		FROM hospital_data
  		GROUP BY Hospital_Name;
```

#### 3. **Top 3 Departments with the Highest Number of Patients**
*Objective*: Find the top 3 hospital departments that have the highest number of patients.

```sql
      SELECT Department, SUM(Patients_Count) AS Total_Patients
  		FROM hospital_data
  		GROUP BY Department
  		ORDER BY Total_Patients DESC
  		LIMIT 3;
```

### 💰 Financial Performance Analysis

#### 4. **Hospital with Maximum Medical Expenses**
*Objective*: Identify the hospital that recorded the highest medical expenses.
```sql
    SELECT * FROM hospital_data
    		ORDER BY Medical_Expenses DESC    
    			LIMIT 1;
```

#### 5. **Daily Average Medical Expenses**
*Objective*: Calculate the average medical expenses per day for each hospital.
```sql
    SELECT 
        Location AS Hospital_Name,
        AVG(Medical_Expenses / (Discharge_Date - Admission_Date + 1)) AS Average_Daily_Expenses
    FROM hospital_data
    WHERE Discharge_Date >= Admission_Date
    GROUP BY Location
    ORDER BY Average_Daily_Expenses DESC;
```

### 🕐 Operational Efficiency Analysis

#### 6. **Longest Hospital Stay**
*Objective*: Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
```sql
    SELECT  * ,
    		   (Discharge_Date - Admission_Date) AS Stay_Duration
    			FROM hospital_data
    			ORDER BY Stay_Duration DESC
    			LIMIT 1;
```

#### 7. **Total Patients Treated Per City**
*Objective*: Count the total number of patients treated in each city.
```sql
    SELECT Location AS City, SUM(Patients_Count) AS Total_Patients
    		FROM hospital_data
    		GROUP BY Location;
```

#### 8. **Average Length of Stay Per Department**
*Objective*: Calculate the average number of days patients spend in each department.
```sql
    SELECT Department, 
    	     	  ROUND(AVG(Discharge_Date - Admission_Date), 2) AS Avg_Stay_Days
    		FROM hospital_data
    		GROUP BY Department;
		
```

### 📈 Performance Benchmarking

#### 9. **Identify the Department with the Lowest Number of Patients**
*Objective*: Find the department with the least number of patients.
```sql
  SELECT Department, SUM(Patients_Count) AS Total_Patients
  		FROM hospital_data
  		GROUP BY Department
  		ORDER BY Total_Patients ASC
  		LIMIT 1;

```

#### 10. **Monthly Medical Expenses Report**
*Objective*: Group the data by month and calculate the total medical expenses for each month.
```sql
  SELECT 
  	    TO_CHAR(Admission_Date, 'YYYY-MM') AS Month,
  	    SUM(Medical_Expenses) AS Total_Expenses
  		FROM hospital_data
  		GROUP BY Month
  		ORDER BY Month;	
```

## 🎯 Key Insights & Business Impact

### 📊 Healthcare Analytics Findings

1. **Patient Volume Optimization**: Identified peak departments and seasonal trends
2. **Resource Allocation**: Analyzed doctor-to-patient ratios for staffing decisions
3. **Cost Management**: Tracked daily expense patterns for budget optimization
4. **Operational Efficiency**: Measured average stay durations for process improvement
5. **Geographic Analysis**: Evaluated city-wise patient distribution for expansion planning

### 🏆 Business Value

- **Cost Optimization**: Identified hospitals with highest operational expenses
- **Resource Planning**: Analyzed department utilization for staff allocation
- **Performance Metrics**: Established benchmarks for hospital efficiency
- **Strategic Planning**: Provided data-driven insights for healthcare management

## 🔧 Technical Skills Demonstrated

- **SQL Aggregate Functions**: SUM, AVG, COUNT
- **Data Grouping**: GROUP BY operations with multiple dimensions
- **Date Calculations**: Date arithmetic for stay duration analysis
- **Sorting & Filtering**: ORDER BY and LIMIT for top/bottom analysis
- **Financial Calculations**: Cost per day and expense aggregation
- **Time Series Analysis**: Monthly trend analysis

## 🎓 Certification Achievement

This project successfully demonstrates proficiency in:
- Healthcare data analysis using SQL
- Business intelligence reporting
- Database querying and optimization
- Data-driven decision making
- Healthcare operational metrics

---

*Project completed as part of the 30 Days SQL Micro Course Certificate Program*
