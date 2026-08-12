# HR-Employee-Attrition-Analysis

## Project Overview

Employee attrition can have a significant impact on workforce stability, productivity, and organizational costs. 
This project analyses employee data to understand where attrition is highest and identify the factors associated with employees leaving the organization.

The project covers data cleaning, data validation, exploratory analysis, attrition analysis and interactive dashboard development using SQL and Power BI.

The dataset contains 423 employee records and 30 columns.

## Business Questions

This analysis focuses on answering two main questions:

1. Where is employee attrition highest?
2. What factors are associated with higher employee attrition?

## Key Metrics

- Total Employees: 423
- Attrited Employees: 205
- Active Employees: 218
- Overall Attrition Rate: 48.46%

## Key Findings

### Where is Attrition Highest?

- The Sales department recorded the highest attrition rate at 56.76%.
- The SD1 position recorded the highest position-level attrition at 83.33%, with 10 out of 12 employees leaving.
- Employees with 1–3 years of service recorded an attrition rate of 56.55%.
- Employees aged 35 and above recorded an attrition rate of 55.49%.
- Employees with PhD qualifications recorded the highest attrition among education groups at 52.49%.

### Factors Associated with Higher Attrition

- Low employee engagement: 100% attrition
- Management dissatisfaction: 70.72%
- Low training exposure: 70.45%
- Compensation dissatisfaction: 68.01%
- Poor work-life balance: 67.21%
- No promotion: 60%
- Job security dissatisfaction: 52.98%

Peer relationships showed comparatively little difference in attrition, suggesting that they may have a weaker association with employee turnover in this dataset.

## Tools Used

- **MySQL** – Data cleaning, validation, exploratory analysis, and attrition analysis
- **Power BI** – Interactive dashboard development and data visualization
- **DAX** – KPI calculations and analytical measures
- **Excel** – Data review and supporting analysis

## Power BI Dashboard

The Power BI dashboard contains seven analytical pages:

1. **Workforce Overview** – Overall workforce composition and key employee metrics
2. **Attrition Analysis** – Attrition by department, position, age group, and years of service
3. **Department Benchmarking** – Department-level comparison of headcount, attrition, engagement and training
4. **Satisfaction & Engagement Analysis** – Employee engagement and job satisfaction analysis
5. **Training & Promotion Analysis** – Training exposure, promotion patterns and attrition by promotion status
6. **Salary & Compensation Analysis** – Salary patterns, salary ranges, compensation satisfaction and attrition by salary range
7. **Executive Summary** – Key findings and prioritized recommendations

## Business Recommendations

Based on the analysis, the following areas could be prioritized to support employee retention:

- **Improve employee engagement:** Employees with low engagement showed the highest attrition, indicating a need for regular engagement monitoring and targeted interventions.
- **Strengthen manager effectiveness:** High attrition among employees dissatisfied with management suggests the need for stronger manager training, feedback mechanisms, and regular employee-manager check-ins.
- **Expand training opportunities:** Employees with low training exposure experienced higher attrition, highlighting the importance of accessible learning and development opportunities.
- **Review compensation practices:** Higher attrition among employees dissatisfied with compensation suggests reviewing pay competitiveness and communicating compensation structures clearly.
- **Support work-life balance:** Flexible work practices, workload monitoring, and employee well-being initiatives may help address work-life balance concerns.
- **Create clearer career paths:** Higher attrition among employees without promotions indicates the importance of transparent promotion criteria and internal career development opportunities.
- **Prioritize high-risk workforce segments:** Retention initiatives should particularly examine the Sales department, SD1 position, and employees in the early years of service.

> **Note:** These findings represent associations observed within this dataset and should not be interpreted as proof that these factors directly cause employee attrition.

## Project Workflow

Raw Data → Data Cleaning → Data Validation → Exploratory Data Analysis → Attrition Analysis → Power BI Dashboard → Key Findings → Business Recommendations

## Project Status

Completed – SQL analysis, data validation, Power BI dashboard, key findings and business recommendations.
