# Task_1_Elevate_Labs

This project demonstrates a complete data cleaning workflow on a sales dataset containing missing values, duplicates, and inconsistent formatting. The goal is to prepare the dataset for reliable analysis and insights.

Dataset Information

The dataset contains the following columns:

1. group
2. customer\_segment
3. sales\_before
4. sales\_after
5. customer\_satisfaction\_before
6. customer\_satisfaction\_after
7. purchase\_made

Data Cleaning Steps

1. Load Dataset – Import raw data into Google Colab.
2. Identify Missing Values – Detect with `.isnull()` and handle using `.dropna()`.
3. Remove Duplicates – Clean repeated entries with `.drop_duplicates()`.
4. Standardize Text Values – Normalize categorical columns (e.g., lowercase, remove spaces).
5. Rename Columns – Apply consistent naming (snake\_case).
6. Fix Data Types – Convert numerical and categorical fields to proper formats.
7. Export Cleaned Dataset – Save as a new CSV file (`cleaned_sales.csv`).

Code Implementation

import pandas as pd

# Step 1: Load dataset
df = pd.read_csv("sales_with_nans.csv")

# Step 2: Handle missing values
print("Missing values before cleaning:\n", df.isnull().sum())
df = df.dropna()

# Step 3: Remove duplicates
df = df.drop_duplicates()

# Step 4: Standardize text values
df['Customer_Segment'] = df['Customer_Segment'].str.strip().str.lower()

# Step 5: Rename columns
df.columns = df.columns.str.strip().str.lower().str.replace(" ", "_")

# Step 6: Fix data types
df['sales_before'] = df['sales_before'].astype(float)
df['sales_after'] = df['sales_after'].astype(float)
df['customer_satisfaction_before'] = df['customer_satisfaction_before'].astype(int)
df['customer_satisfaction_after'] = df['customer_satisfaction_after'].astype(int)

# Step 7: Export cleaned dataset
df.to_csv("cleaned_sales.csv", index=False)
print("Cleaned dataset saved successfully!")


How to Run

1. Open Google Colab
2. Upload the raw dataset (`sales_with_nans.csv`).
3. Copy and run the above code cells.
4. Download the cleaned dataset:

python

from google.colab import files
files.download("cleaned_sales.csv")

 Before vs After Cleaning

| Aspect          | Before Cleaning                              | After Cleaning                               |
| --------------- | -------------------------------------------- | -------------------------------------------- |
| Missing Values  | Present in multiple columns                  | All handled (removed/imputed)                |
| Duplicates      | Several duplicate rows                       | Removed                                      |
| Text Formatting | Inconsistent (e.g., `Premium ` vs `premium`) | Standardized (all lowercase, trimmed spaces) |
| Column Names    | Mixed case, spaces                           | Snake\_case (clean & uniform)                |
| Data Types      | Inconsistent (object for numbers)            | Corrected (float/int/categorical)            |
| File            | `sales_with_nans.csv` (raw)                 | `cleaned_sales.csv` (ready for analysis)     |

Output

cleaned_sales.csv → Clean dataset ready for analysis.
Dataset is consistent, duplicate-free, and formatted correctly.

Key Takeaways

Data cleaning ensures **accuracy and reliability**.
Pandas offers efficient tools to handle missing values, duplicates, and inconsistent formatting.
A clean dataset forms the foundation for **insightful analysis and modeling**.





