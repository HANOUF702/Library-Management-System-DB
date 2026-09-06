# Library Management System (LMS) - Relational Database

A robust, production-ready relational database built with **MySQL** for managing library operations. Developed during my IT cooperative training.

## 📌 Project Overview
This project transitions abstract logical designs (ERD) into a fully functional physical database containing **10 structured relational tables** (Student, Employee, Manager, Book, Category, Study_Room, Borrow, Return, Room_Booking, and Book_Update).

## ⚙️ Key Features
- **Data Integrity Constraints:** Implemented PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, and DEFAULT constraints.
- **Business Rule Enforcement:** Used `CHECK` constraints to ensure logical validity (e.g., non-negative fines, valid time slots, and chronological dates).
- **Advanced SQL Queries:** Evaluated system performance using multi-table JOINs, aggregations (GROUP BY, HAVING), and nested subqueries.

## 🛠️ Tech Stack
- **Database:** MySQL / MySQL Workbench
- **Language:** SQL (DDL & DML)
