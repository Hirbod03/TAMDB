# SQL Project: Teaching Assistant Management System

## Overview
This project is designed to showcase my SQL skills through the development of a comprehensive database for managing teaching assistants (TAs) and their assignments at a university. The database will track TA details, the courses they assist with, and their preferences. This project involves ER diagram design, SQL data manipulation, and complex querying to demonstrate proficiency in SQL.

## Purpose
The primary goals of this project are to:
- Design a relational database using an ER diagram.
- Implement the database in MySQL.
- Perform various SQL operations such as data insertion, modification, deletion, and querying.
- Showcase SQL best practices and advanced querying techniques.

## Project Description
The Computer Science department at Western University requires a system to manage information about their TAs. The database created in this project will store information about TAs, the courses they assist with, and their preferences. The final database will support an application developed in a future project.

### Database Requirements
#### Teaching Assistant (TA) Information
- `first_name`: VARCHAR(30), NOT NULL
- `last_name`: VARCHAR(30), NOT NULL
- `student_number`: CHAR(9), UNIQUE, NOT NULL
- `western_user_id`: VARCHAR(8), UNIQUE, PRIMARY KEY
- `degree`: ENUM('PhD', 'Masters')
- `image`: VARCHAR(255) (or BLOB if storing the image)

#### Course Information
- `course_number`: CHAR(6), UNIQUE, format 'CS####'
- `course_name`: VARCHAR(30), NOT NULL
- `level`: INT (1, 2, 3, or 4) or NULL
- `year_created`: YEAR

#### Course Offering Information
- `courseOfferId`: CHAR(4), UNIQUE
- `num_students`: INT, greater than 0
- `term`: ENUM('Fall', 'Spring', 'Summer'), NOT NULL
- `year`: YEAR, greater than 1964, NOT NULL

### Relationships
- Track which TAs have worked on which course offerings and the hours worked.
- Track TAs' preferences (loved or hated courses).

## SQL Script Components
### 1. Updates
- Include comments for clarity.
- Display data before and after updates.
- Update course titles and TA hours.

### 2. Inserts
- Insert a new course and its offerings.
- Add a new TA and their course preferences.
- Display the inserted data.

### 3. Queries
- Write 15 SQL queries to demonstrate complex data retrieval.
- Use comments to identify each query and its purpose.

### 4. Deletes and Views
- Create a view for TAs' hated courses.
- Perform deletions and demonstrate results.
- Update the TA table structure and contents.

## How to Run the Scripts
1. **Initial Setup**: Download and save the initial setup script as `script1.sql`.
2. **Run Initial Script**:
   ```sh
   sudo mysql -nvvf --verbose -pyourpassword < script1.sql > outputscript1.txt 2>&1
   ```
3. **Develop Script**: Create and edit your script `last2digits_script2.sql`.
4. **Run Your Script**:
   ```sh
   sudo mysql -nvvf --verbose -pyourpassword < last2digits_script2.sql > last2digits_outputscript2.txt 2>&1
   ``

## Showcase of Skills
This project demonstrates the following SQL capabilities:
- **Database Design**: Creating a normalized database schema from a real-world scenario.
- **Data Manipulation**: Inserting, updating, and deleting records efficiently.
- **Complex Queries**: Writing advanced SQL queries to retrieve and analyze data.
- **Best Practices**: Using SQL best practices for naming conventions, indexing, and query optimization.

### Sample Script
Refer to the provided [sample script](http://www.csd.uwo.ca/~lreid/cs3319/assignments/assignment2/samplescriptmysql.txt) for guidance on formatting and content.
