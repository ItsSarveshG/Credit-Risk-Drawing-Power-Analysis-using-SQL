# Credit-Risk-Drawing-Power-Analysis-using-SQL

**Project Overview**

1.  This project focuses on credit risk assessment and working capital monitoring using SQL.
2.  The objective is to analyze borrower credit profiles, monitor Drawing Power (DP), detect over-limit utilization, and identify high-risk accounts using real-world banking logic.
3.  The project simulates how banks, NBFCs, and financial institutions track credit exposure and portfolio risk.

**Dataset Description**

The project uses synthetic but realistic credit data structured into three tables:
1️⃣ Customer Master

1.  Borrower profile
2.  Industry, entity type
3.  Credit rating
4.  Relationship vintage

2️⃣ Credit Facility

1.  Facility type (CC / OD / Term Loan)
2.  Sanctioned limit & outstanding
3.  ROI, tenure
4.  Security type

3️⃣ Stock & Drawing Power

1.  Raw material, WIP, finished goods
2.  Receivables & creditors
3.  Eligible percentage
4.  Calculated Drawing Power (DP)

   **Drawing Power Formula Used**

DP = (Raw Material + WIP + Finished Goods + Receivables – Creditors) × Eligible %
_This mirrors actual working capital DP calculation used in banks._

**Key Analysis Performed**

**Portfolio & Exposure Analysis**

1.  Total sanctioned vs outstanding
2.  Industry-wise exposure concentration
3.  Top borrowers by exposure

**Utilization Monitoring**

1.  Utilization percentage per account
2.  High utilization (>90%) accounts
3.  Fully utilized and overdrawn limits

**Drawing Power (DP) Monitoring**

1.  DP vs outstanding comparison
2.  DP breach (over-limit) identification
3.  DP utilization percentage

**Credit Risk Profiling**

1.  Credit rating-wise exposure
2.  Low-rated + high-utilization accounts
3.  Vintage-based risk segmentation

**Security & Facility Risk**

1  Security-wise exposure
2.  High exposure under hypothecation

**Profitability Analysis**

1.  Expected annual interest income
2.  Industry-wise interest contribution

**Advanced Risk Scoring**

Composite risk score using:
1.  Credit rating
2.  Limit utilization
3.  DP breaches

**Tools & Skills Used**

1.  SQL (Joins, CASE, Aggregations, Subqueries)
2.  Credit Risk Analysis
3.  Working Capital & DP Monitoring
4.  Portfolio Risk Assessment
5.  Financial Domain Knowledge

