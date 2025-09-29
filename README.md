
# 📊 SQL Joins 

This repository is designed to **practice SQL joins (INNER, LEFT, RIGHT, FULL, and SELF JOIN)** using a simple **Products & Orders** database. It is compatible with **PostgreSQL** and can be run on tools like **pgAdmin4,  or DB Browser for SQLite / MySQL Workbench**.

## 📂 Project Structure

* **schema.sql** → Contains database schema (tables + relationships).
* **data.sql** → Contains sample data for testing joins.
* **queries.sql** → Contains 20 SQL queries using different types of joins.
* **README.md** → Project overview, join explanations, and documentation.
* **ER Diagram** → Shows relationship between `Products` and `Orders` (One Product → Many Orders).




## 🔑 SQL Join Types Explained

* **INNER JOIN** → Returns rows when there is a match in both tables.
* **LEFT JOIN** → Returns all rows from the left table, and matched rows from the right table; unmatched rows from the right appear as NULL.
* **RIGHT JOIN** → Returns all rows from the right table, and matched rows from the left table; unmatched rows from the left appear as NULL.
* **FULL JOIN** → Returns all rows when there is a match in one of the tables, filling unmatched parts with NULLs.
* **SELF JOIN** → Joins a table with itself, useful for comparing rows within the same table.

## 🧪 Learning Objectives

* Understand **table relationships** (foreign keys).
* Master **INNER, LEFT, RIGHT, FULL OUTER, and SELF JOINS**.
* Learn to calculate **aggregations, groupings, and conditions** with joins.

## 🚀 Example Query

```sql
-- Show total revenue per order
SELECT o.OrderID, SUM(o.Quantity * p.Price) AS OrderRevenue
FROM Products p
RIGHT JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY o.OrderID;
```

## 🎯 Outcome

✅ Understanding of SQL joins.

✅ Understanding of merging data across multiple tables.

✅ Being able to explain practical scenarios of joins in interviews.

---
