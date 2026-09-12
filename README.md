
# E-commerce Inventory & Sales SQL Analysis

## 📌 Project Overview
This project showcases a relational database design for a functional E-commerce system. It simulates real-world business scenarios by managing inventory levels, processing shopper transactions, and extracting actionable business intelligence using optimized SQL code.

## 🛠️ Tech Stack & Key Concepts Used
* **Database Platform:** MySQL / PostgreSQL
* **Core Concepts:** Relational Database Design, Primary & Foreign Key Relations, Constraints
* **Advanced Analytical Tools:** Multi-table Inner Joins, Subqueries, Conditional CASE Logic, CTEs (Common Table Expressions), Window Functions (`DENSE_RANK()`)

## 📊 Database Architecture (Schema)
The database structure consists of three normalized tables:
1. `Products`: Tracks item names, categories, pricing, and live warehouse inventory numbers.
2. `Customers`: Stores customer profile details and geographic location.
3. `Orders`: Captures transactional sales logs connecting buyers directly to inventory items.

## 💡 Business Problems Solved (Key Queries)
The main script handles three specific requests typically needed by business stakeholders:
* **High-Value Revenue Reports:** Calculates dynamic units sold and totals gross sales per product to pinpoint best-selling items.
* **Automated Low-Stock Trigger Alerts:** Employs logical evaluations to sort stock items into actionable statuses (`Out of Stock`, `Low Stock`, or `Healthy Stock`).
* **Customer Leaderboard & Ranking:** Ranks client spending patterns utilizing a window density rank formula to isolate high-value repeat shoppers.

---
*Thank you for exploring this project! Feel free to review the full code inside the `ecommerce_analysis.sql` file.*
