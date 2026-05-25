# DATA-AGENT-PROJECT

# Retail Sales Data Agent – Databricks Project

## Project Overview

This project was developed as part of the  Retail Sales Data Agent Task. The objective of the project was to build a fully functional AI-powered Retail Sales Data Agent using Databricks and a retail sales dataset.

The project focused on transforming raw retail transaction data into meaningful business insights through SQL analysis, data preparation, and AI-assisted querying. The final outcome was an intelligent Data Agent capable of helping business owners, managers, and decision-makers understand sales performance, customer behaviour, revenue trends, and product performance using natural language questions.

This project demonstrates practical skills in:

* SQL querying
* Data cleaning and validation
* Business intelligence analysis
* AI Data Agent development
* Retail analytics
* Data storytelling
* Databricks Query Editor usage
* GitHub project documentation

---

# Project Objective

The main objective of this project was to:

* Build a working Retail Sales Data Agent on Databricks
* Analyse a retail sales dataset using SQL
* Prepare and structure the dataset for AI interaction
* Create business-focused analytical queries
* Generate insights for decision-making
* Test and validate the AI agent's responses
* Document the entire development journey professionally

The project was also designed to evaluate the ability to understand business requirements, work with data independently, and create a functional AI-powered analytics solution.

---

# Project Story – The Journey Behind the Data Agent

The project began with the exploration of a retail sales dataset containing transaction-level information such as customer demographics, product categories, quantities sold, revenue generated, and transaction dates.

Before building the AI Data Agent, the dataset first had to be understood thoroughly. The process started inside Databricks Query Editor, where SQL queries were written to inspect the dataset structure, identify null values, validate records, and understand the relationships between customers, sales, and products.

The first phase focused on data familiarisation and preparation. Queries were used to:

* Review the dataset
* Count total records
* Detect missing values
* Categorise customers into age groups
* Analyse customer spending behaviour
* Calculate total revenue
* Analyse monthly and daily sales trends
* Rank product categories by revenue
* Identify high-spending customers
* Investigate customer purchasing behaviour

Once the dataset was fully understood, the next phase involved creating analytical SQL queries that could answer real-world business questions. The project evolved from simple data inspection into deeper business intelligence analysis.

Several important business insights were discovered during the process:

* Certain product categories generated significantly more revenue than others.
* Monthly sales trends revealed periods of stronger business performance.
* Different age groups displayed different spending patterns.
* Female and male customers contributed differently across product categories.
* There were no repeat customers in the dataset, indicating a once-off purchasing pattern.
* Some categories produced higher average transaction values than others.

The SQL analysis became the foundation for building the Retail Sales Data Agent. The agent was then connected to the `retail_sales_data` table inside Databricks so that users could ask business questions in plain language and receive data-driven responses.

The project also involved validating AI-generated answers against manually written SQL queries to ensure accuracy and reliability. During validation, one of the agent outputs relating to customer spending behaviour produced an incorrect result. To solve this issue, the SQL query was manually adjusted and tested again in Genie Space within Databricks for improved accuracy. This demonstrated the importance of data validation and quality assurance when working with AI systems.

Overall, the project simulated a real-world business analytics workflow — starting from raw transactional data and ending with an intelligent AI assistant capable of generating actionable business insights.

---

# Dataset Overview

The dataset used in this project was stored as:

```sql
workspace.default.retail_sales_data
```

## Dataset Columns

| Column Name      | Description                   |
| ---------------- | ----------------------------- |
| Transaction ID   | Unique transaction identifier |
| Date             | Transaction date              |
| Customer ID      | Unique customer identifier    |
| Gender           | Customer gender               |
| Age              | Customer age                  |
| Product Category | Category of purchased product |
| Quantity         | Number of items purchased     |
| Price per Unit   | Unit price of the product     |
| Total Amount     | Total transaction value       |

---

# Technologies & Tools Used

| Tool                    | Purpose                                   |
| ----------------------- | ----------------------------------------- |
| Databricks              | Data analysis and AI Data Agent creation  |
| SQL                     | Data querying and analysis                |
| GitHub                  | Project documentation and version control |
| CSV Dataset             | Retail transaction data source            |
| Databricks Query Editor | SQL execution and validation              |
| AI Data Agent           | Natural language business analysis        |

---

# SQL Analysis Performed

The following analyses were conducted using SQL inside Databricks Query Editor:

## Data Exploration

* Table overview
* Dataset preview
* Record counting
* Null value checks

## Customer Analysis

* Age group classification
* Spending behaviour by age group
* Customer purchase frequency
* Highest spending customers
* Gender-based sales analysis

## Revenue Analysis

* Total revenue generated
* Revenue by product category
* Revenue contribution percentage
* Monthly revenue trends
* Daily revenue trends
* Running total revenue

## Product Analysis

* Best-selling product categories
* Revenue ranking by category
* Most profitable categories
* Quantity sold analysis

## Transaction Analysis

* Average transaction value
* Average quantity purchased
* Top 10 highest transactions

## Advanced SQL Concepts Used

* CASE Statements
* Aggregate Functions
* Window Functions
* Common Table Expressions (CTEs)
* GROUP BY
* HAVING Clauses
* ORDER BY
* Ranking Functions

---

# Example SQL Concepts Used

## CASE Statement Example

The CASE statement was used to categorise customers into age groups:

```sql
CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
END AS age_group
```

## Window Function Example

Running revenue analysis was performed using a window function:

```sql
SUM(`Total Amount`) OVER (ORDER BY `Date`) AS running_total_revenue
```

## Common Table Expression (CTE)

```sql
WITH category_sales AS (
    SELECT `Product Category`,
           SUM(`Total Amount`) AS total_sales
    FROM workspace.default.retail_sales_data
    GROUP BY `Product Category`
)
SELECT *
FROM category_sales
ORDER BY total_sales DESC
```

---

# Key Business Insights

Some of the major findings from the project included:

* Product categories contributed differently to total business revenue.
* Monthly sales trends showed changes in purchasing activity over time.
* Different customer age groups had different average spending patterns.
* Certain transactions generated exceptionally high revenue.
* The dataset did not contain repeat customers.
* Revenue contribution percentages highlighted the strongest-performing categories.
* Gender-based analysis revealed purchasing differences across categories.

---

# AI Data Agent Testing

The Retail Sales Data Agent was tested using multiple business-focused questions, including:

* What is the total revenue generated?
* Which product category performs best?
* Which age group spends the most?
* What are the monthly sales trends?
* Which customers spent the most money?
* What is the average transaction value?
* Which product categories generate the least revenue?
* Which gender contributes the highest sales?
* What are the daily revenue trends?
* Are there any repeat customers?

The agent successfully answered most questions accurately.

---

# Validation & Problem Solving

One of the important aspects of the project was validating AI-generated responses against manually written SQL queries.

During testing:

* 9 out of 10 questions produced correct outputs.
* The customer spending behaviour query initially produced inaccurate results.
* The issue was corrected by manually refining and testing the SQL query inside Databricks Genie Space.

This demonstrated:

* The importance of validating AI-generated insights
* The need for accurate SQL logic
* The role of human oversight in AI systems
* Practical debugging and analytical problem-solving skills

---

# What I Learned

Through this project, I gained practical experience in:

* Building AI-powered Data Agents
* Writing analytical SQL queries
* Performing business intelligence analysis
* Data validation techniques
* Debugging SQL queries
* Structuring datasets for AI interaction
* Creating business-focused insights
* Documenting technical projects professionally

The project also strengthened my understanding of how AI and data analytics can assist businesses in making informed decisions.

---

# Conclusion

This project successfully demonstrated how raw retail transaction data can be transformed into valuable business intelligence using SQL, Databricks, and AI Data Agents.

The Retail Sales Data Agent provided a practical solution for analysing customer behaviour, revenue trends, product performance, and sales insights through natural language interaction.

Beyond technical implementation, the project highlighted the importance of:

* Data quality
* Validation
* Critical thinking
* Business understanding
* AI oversight

Overall, this project served as a complete end-to-end data analytics and AI implementation experience, combining data engineering, SQL analytics, business intelligence, and AI-assisted decision-making into one integrated solution.

---

# Repository Contents

This repository contains:

* README.md
* Retail Sales Dataset
* SQL Queries
* Screenshots
* Databricks Agent Configuration
* Validation Evidence
* Final Project Documentation

---

# Author

**Mpho Lesunyane**
LLB Candidate | Legal-Tech & Data Analytics Enthusiast | SQL & Power BI Practitioner
