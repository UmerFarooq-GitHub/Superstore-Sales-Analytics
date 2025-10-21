# 🧠 Superstore Sales & Marketing Analysis Dashboard

## 📊 Project Overview
An end-to-end **Sales & Marketing Data Analysis** project built using **SQL Server (SSMS)** and **Power BI**, designed to analyze and visualize Superstore sales performance across regions, categories, and customer segments.  
This project demonstrates real-world data cleaning, transformation, DAX measure creation, and dashboard storytelling for data-driven business insights.

---

## 🧰 Tools & Technologies
- **SQL Server (SSMS):** Data cleaning, validation, and transformation  
- **Power BI Desktop:** Data modeling, KPI visualization, and interactivity  
- **DAX (Data Analysis Expressions):** Calculated columns and custom KPIs  
- **Microsoft Excel / CSV (Kaggle):** Superstore dataset source  
- **Power Query:** Data type conversion and preprocessing  

---

## 🧩 Key Features
- Cleaned and standardized **9,994 sales records** from the Superstore dataset  
- Fixed city–postal mismatches, standardized text case, validated order/ship dates  
- Created calculated columns:
  - `Order-to-Ship Days` (time between order and shipping)  
  - `Profit %` (two-decimal profitability ratio)
- Developed key DAX measures:
  - `Total Sales`
  - `Total Profit`
  - `Average Profit %`
  - `Average Order-to-Ship Days`
- Designed interactive visuals:
  - Sales & Profit by **Category**, **Sub-Category**, **Region**, and **Segment**  
  - Year-over-Year sales trend  
  - KPI cards for summary insights  
  - Slicers for Year, Region, Category, and Segment filters  

---

## 🎨 Dashboard Design Highlights
- **Theme Colors:**  
  - Primary: `#00AEEF` (bright blue)  
  - Secondary: `#004E70` (navy blue)  
  - Accent: `#E0F7FE` (light cyan)
- **Typography:** Segoe UI / Calibri for consistency and clarity  
- **Layout:**  
  - Top section – KPI Cards (Sales, Profit, Margin, Order-to-Ship)  
  - Middle – Category & Regional Visuals  
  - Bottom – Segment Analysis & Trends  
- **Interactive Slicers:** Modern button-style with highlighted states  

---

## 🧾 SQL Workflow Summary
1. **Data Import:** Loaded the “Sample - Superstore” dataset into SQL Server  
2. **Cleaning & Standardization:** Trimmed spaces, unified casing, validated postal codes  
3. **Transformation:** Derived `Profit %` and `Order-to-Ship Days` columns  
4. **Validation:** Ensured no missing values, duplicates, or invalid records  
5. **Integration:** Connected Power BI to SQL Server for real-time analytics  

---

## 📈 Key Insights
- 💰 **Technology** is the top-performing category with highest revenue and profit  
- 🌎 **West Region** leads in profitability, followed by the East  
- 📦 **Average Order-to-Ship Time:** ~3.4 days, indicating efficient logistics  
- 🧭 Profit margins vary across segments, suggesting opportunities for pricing optimization  

---

## 🧠 Learning Outcomes
- Practical experience with **SQL-based data preprocessing**  
- Built a live connection from **SQL Server to Power BI**  
- Applied **DAX formulas** for business KPIs and metrics  
- Designed a professional dashboard with consistent theme and layout principles  

---

## 👨‍💻 Author
**Umer Farooq**  
Software Engineer | Data Analytics Enthusiast  
📍 Rawalpindi / Islamabad  

---

## 🏷️ Tags
`SQL` `Power BI` `DAX` `Data Analytics` `Business Intelligence` `ETL` `Dashboard` `Superstore Dataset` `Visualization`
