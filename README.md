# End-to-End Business Intelligence Platform

An end-to-end BI solution built on the AdventureWorks dataset — from raw CSV files to a governed SQL data warehouse to interactive Power BI dashboards. The project follows a standard analytics engineering workflow: **Extract → Clean → Model → Load → Visualize.**

## Overview

This project simulates a real-world Sales & Customer Analytics platform for a retail business. It ingests raw sales, product, customer, territory, and returns data, cleans and transforms it with Python, models it into a Star Schema in SQL Server, and delivers business insights through four Power BI dashboards.

## Architecture

```
Raw CSV Files (AdventureWorks)
        │
        ▼
Python (Pandas) — Data Cleaning & Transformation
        │
        ▼
SQL Server — Star Schema Data Warehouse
        │
        ▼
Power BI — DAX Measures & Dashboards
```

## Tech Stack

| Layer | Tools |
|---|---|
| Data Cleaning / ETL | Python, Pandas, Jupyter Notebooks |
| Data Warehouse | SQL Server, T-SQL (Star Schema) |
| Data Modeling | Dimensional Modeling (Fact & Dimension tables) |
| Visualization | Power BI Desktop, DAX |
| Version Control | Git, GitHub |

## Data Model (Star Schema)

**Fact Tables**
- `FactSales` — order-level sales transactions
- `FactReturns` — product return transactions

**Dimension Tables**
- `DimCustomer` — customer demographics
- `DimProduct` — product, category, and subcategory attributes
- `DimDate` — calendar table (year, quarter, month, week, day)
- `DimTerritory` — sales region and country

## Project Structure

```
End-to-End-BI-Platform/
│
├── data/
│   ├── raw/                  # Original AdventureWorks CSV files
│   └── cleaned/              # Cleaned datasets ready for the warehouse
│
├── python/
│   ├── 01_data_exploration.ipynb   # Customers
│   ├── 02_products.ipynb           # Products, Categories, Subcategories
│   ├── 03_sales.ipynb              # Sales 2015–2017 → FactSales
│   ├── 04_calendar.ipynb           # Calendar → DimDate
│   ├── 05_territories.ipynb        # Territories → DimTerritory
│   ├── 06_returns.ipynb            # Returns → FactReturns
│   ├── 07_load_to_sql.ipynb        # Loads cleaned data into SQL Server
│   └── run_pipeline.py             # Automated ETL pipeline script
│
├── sql/
│   └── create_star_schema.sql      # Star Schema DDL (tables, keys)
│
├── power-bi/
│   ├── klea_picalli_shtese.pbix
│   └── screenshots/
│       ├── executive_dashboard.png
│       ├── sales_dashboard.png
│       ├── customer_dashboard.png
│       └── product_dashboard.png
│
├── requirements.txt
└── README.md
```

## Data Pipeline

1. **Extract** — read raw CSVs (Customers, Products, Sales 2015–2017, Calendar, Territories, Returns)
2. **Transform** — handle missing values, merge related tables, engineer new columns (e.g. `Profit`, date parts, age groups), and standardize schemas across years
3. **Load** — push the six cleaned datasets into a SQL Server Star Schema warehouse
4. **Model & Visualize** — connect Power BI to the warehouse, define relationships, write DAX measures, and build dashboards

## DAX Measures

| Measure | Description |
|---|---|
| `Sales Amount` | `OrderQuantity × ProductPrice` |
| `Total Cost` | `OrderQuantity × ProductCost` |
| `Total Profit` | Sales Amount − Total Cost |
| `Profit Margin %` | Total Profit ÷ Sales Amount |
| `Total Orders` | Distinct count of orders |
| `Total Quantity Sold` | Sum of units sold |
| `Total Returns` | Sum of returned units |
| `Return Rate %` | Total Returns ÷ Total Quantity Sold |
| `Average Order Value` | Sales Amount ÷ Total Orders |

## Dashboards

**1. Executive Dashboard** — high-level KPIs, revenue trend over time, sales by category, regional performance

**2. Sales Dashboard** — sales trend by year/month, top-selling products, sales by category and territory, order-level detail

**3. Customer Dashboard** — sales by gender, income bracket, education level, and age group

**4. Product Dashboard** — profit and returns by product and category, best-selling and most-returned products

## Screenshots

![Executive Dashboard](power-bi/screenshots/executive_dashboard.png)
![Sales Dashboard](power-bi/screenshots/sales_dashboard.png)
![Customer Dashboard](power-bi/screenshots/customer_dashboard.png)
![Product Dashboard](power-bi/screenshots/product_dashboard.png)

## How to Run

1. Clone the repository
   ```
   git clone https://github.com/kleapicalli18-beep/end-to-end-bi-platform.git
   ```
2. Install Python dependencies
   ```
   pip install -r requirements.txt
   ```
3. Run the notebooks in `python/` in order (01 → 07), or run the full pipeline:
   ```
   python python/run_pipeline.py
   ```
4. Execute `sql/create_star_schema.sql` against your SQL Server instance to create the warehouse schema
5. Open `power-bi/klea_picalli_shtese.pbix` in Power BI Desktop and point the data source to your SQL Server database

## Future Improvements

- Migrate the data warehouse and ETL pipeline to Azure (Blob Storage, Data Factory, Azure SQL Database) for a fully cloud-based architecture
- Automate the pipeline on a schedule (e.g. with Azure Data Factory or a cron job)
- Add row-level security and incremental refresh in Power BI

## Author

**Klea Picalli**
Informatikë Ekonomike (Economic Informatics), Universiteti Europian i Tiranës (UET)
