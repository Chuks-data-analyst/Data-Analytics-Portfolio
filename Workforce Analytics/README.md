# Workforce Insights Dashboard (SQL + Power BI)


## Project Overview  
This dashboard was developed to provide a comprehensive analysis of global workforce data, offering key insights into employee demographics, hiring trends, salary distribution, and attrition rates. It serves as a valuable tool for HR professionals, department managers, and business leaders to make data-driven decisions regarding talent management and strategy.  

## Problem Statement  
Employee attrition and workforce distribution remain critical challenges for global organizations. HR teams and business leaders often struggle to identify which departments face the highest turnover, where salary gaps exist, and how workforce distribution impacts hiring strategies. Without clear visibility into these patterns, companies risk higher recruitment costs, reduced productivity, and missed opportunities for proactive workforce planning.  



## Objectives  
- Monitor and visualize key workforce KPIs such as total employees, average salary, and attrition rate.  
- Analyze hiring and growth trends over time.  
- Compare average salaries and attrition rates across different departments.  
- Visualize the geographical distribution of the workforce and the breakdown of work modes (On-site vs. Remote).  
- Identify potential areas of concern, such as high-attrition departments, that require further investigation.  


## Key Insights  
- **Workforce Size** – The company has a total of 2 million employees, with an average salary of $896,888.  
- **Attrition Rate** – The overall attrition rate is 20%, indicating a significant portion of employees leaving.  
- **Salary Distribution** – The IT department has the highest average salary, followed by Finance and R&D.  
- **Work Mode** – The workforce is primarily On-site (60%), with a substantial 40% working remotely.  
- **Attrition Hotspot** – The IT department shows the highest attrition, requiring immediate attention and deeper analysis.  


##  Dashboard Screenshots  
<img width="999" height="659" alt="image" src="https://github.com/user-attachments/assets/db7f01b0-6f9f-4257-8fa6-8f266afb4438" />
<img width="997" height="663" alt="image" src="https://github.com/user-attachments/assets/b4d911e4-86dc-4b80-a70f-add42c8eb65c" />




## Impact & Recommendations  

### For HR & Department Managers  
- **Recommendation**: Conduct a root-cause analysis into why the IT and Sales departments have the highest attrition.  
- **Impact**: Targeted retention strategies (e.g., improved compensation, career growth opportunities) can lower turnover and save recruitment costs.  

### For Talent Acquisition Teams  
- **Recommendation**: Actively promote the company's flexible work model (40% remote).  
- **Impact**: Broader talent pool → faster hiring cycles for critical roles.  

### For Business Leaders & Executives  
- **Recommendation**: Use trend data (e.g., peak hiring in 2022) to guide workforce planning and budget allocation.  
- **Impact**: More informed decisions → competitive compensation and aligned staffing with business goals.  


## Methodology  

- **Data Cleaning & Transformation (SQL):**  
  - Removed duplicates, nulls, and unnecessary columns.  
  - Standardized data fields for consistency.  

- **Data Visualization & DAX Measures (Power BI):**  
  - Created DAX measures for KPIs such as total employees, attrition rate, and active employees.  
  - Designed interactive dashboards to visualize trends and insights.  


##  Conclusion  
This project demonstrates my ability to use SQL and Power BI to transform raw workforce data into actionable insights. By analyzing attrition, salary distribution, and workforce demographics, I identified key challenges and opportunities for HR and leadership.  

**Future Enhancements:**  
- Real-time data integration from HR systems.  
- Predictive analytics for attrition forecasting.  
- Department-level drilldowns for more granular insights.  


## Data Source  
The dataset used for this project was sourced from **https://www.kaggle.com/datasets/rohitgrewal/hr-data-mnc**. 

## SQL Scripts
This project involved cleaning and transforming the dataset in SQL before importing it into Power BI.

- [SQL Cleaning & Transformation Script](./Hospital_Management_Queries.sql)


## Download Power BI File  
You can download the full interactive dashboard here:  
https://drive.google.com/file/d/19dQlaJtovGfWiAiscgw7frQjlZbCF6Zq/view?usp=drive_link
