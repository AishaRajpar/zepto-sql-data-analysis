
# 🛒 Zepto Data Analysis (PostgreSQL)

## 📌 Project Overview

This project performs **data exploration, cleaning, and analysis** on a Zepto product dataset using **PostgreSQL**.
It provides insights into product pricing, discounts, stock availability, and category performance.

---

## 🗂️ Table Structure

**Table: zepto**

* sku_id (Primary Key)
* category
* name
* mrp
* discountPercent
* availableQuantity
* discountedSellingPrice
* weightInGms
* outOfStock
* quantity

---

## 🔍 Data Exploration

* Count total records
* View sample data
* Identify NULL values
* List unique categories
* Analyze stock availability
* Detect duplicate product names

---

## 🧹 Data Cleaning

* Remove invalid records (MRP = 0 or price = 0)
* Convert prices from paisa to rupees
* Ensure clean and consistent dataset

---

## 📊 Data Analysis

* Top 10 products by discount
* High MRP but out-of-stock items
* Revenue generated per category
* Expensive products with low discount
* Top categories by average discount
* Price per gram analysis
* Product classification (Low, Medium, Bulk)
* Total inventory weight per category

---

## 🧠 SQL Concepts Used

* SELECT, WHERE, ORDER BY
* GROUP BY, HAVING
* Aggregation (SUM, AVG, COUNT)
* CASE statements
* Data Cleaning (DELETE, UPDATE)

---

## ⚙️ How to Run

1. Open PostgreSQL (pgAdmin / psql)
2. Create database:

```sql id="zdb1"
CREATE DATABASE zepto_db;
```

3. Run SQL script to:

* Create table
* Insert data
* Execute queries

---

## 📌 Purpose

* Practice real-world SQL analysis
* Understand data cleaning techniques
* Generate business insights using SQL

---

## 👩‍💻 Author

Aisha Rajpar
