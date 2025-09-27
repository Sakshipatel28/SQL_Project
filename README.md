SQL Mini Project – User Performance Analysis

 Project Overview
This project analyzes user submissions data on a learning/mentor platform to evaluate user performance.  
The aim is to identify top performers, track daily and weekly progress, and highlight users with most incorrect submissions.  

Database Schema
**Submissions Table**  
- submission_id (Primary Key) – Unique ID for each submission  
- user_id – Unique ID for each user  
- user_name – Name of the user  
- submission_date – Date of submission  
- status – Submission result (Correct / Incorrect)  
- points – Points earned for the submission

A SQL Queries
1. **List all distinct users and their stats**
   - Total submissions per user  
   - Total points earned  

2. **Calculate daily average points for each user**  

3. **Top 3 users with the most correct submissions for each day**  

4. **Top 5 users with the highest number of incorrect submissions**  

5. **Top 10 performers for each week**

Tools Used
- Microsoft SQL Server (PostgreSQL)  
- SQL Queries for data analysis  

 Conclusion
The project provides insights into:  
- Daily and weekly top performers  
- Users with the most incorrect submissions  
- Overall performance trends of users  

These insights can be used for mentoring decisions, rewarding top performers, and identifying users who may need guidance.

