Employee Attrition Prediction using Machine Learning and Power BI

Overview

This project aims to **predict employee attrition** (whether an employee will leave the company or not) using **machine learning** techniques.
It uses Python for model building and **Power BI** for visualizing attrition trends and model insights.

Objectives

* Understand factors influencing employee attrition.
* Build predictive models using **Logistic Regression, Linear Regression, and Decision Tree Classifier**.
* Evaluate and compare model performance.
* Visualize the results interactively using **Power BI dashboards**.

Project Workflow

Step 1: Data Loading and Exploration

* Import the dataset (e.g., `employee_data.csv`).
* Perform basic **data cleaning** (handle missing values, duplicates, and data types).
* Understand the structure of the dataset using:

  ```python
  df.info()
  df.describe()
  df.head()
  ```

Step 2: Data Preprocessing

* Encode categorical variables using `LabelEncoder` or `pd.get_dummies()`.
* Scale numerical features using `StandardScaler`.
* Split data into:

  ```python
  X_train, X_test, y_train, y_test
  ```

Step 3: Model Building

Logistic Regression

```python
from sklearn.linear_model import LogisticRegression
log_model = LogisticRegression(max_iter=1000)
log_model.fit(X_train, y_train)
```

Linear Regression

```python
from sklearn.linear_model import LinearRegression
lin_model = LinearRegression()
lin_model.fit(X_train, y_train)
```

Decision Tree Classifier

```python
from sklearn.tree import DecisionTreeClassifier
dt_model = DecisionTreeClassifier(random_state=42)
dt_model.fit(X_train, y_train)
```

Step 4: Model Evaluation

Evaluate models using metrics like:

```python
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

y_pred_log = log_model.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred_log))
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred_log))
print("Classification Report:\n", classification_report(y_test, y_pred_log))
```

---

Step 5: Feature Importance (Optional)

You can use SHAP or model-based feature importance:

```python
import shap
explainer = shap.TreeExplainer(dt_model)
shap_values = explainer.shap_values(X_test)
shap.summary_plot(shap_values, X_test)
```

---

Step 6: Save Outputs

Save models and results for reuse:

```python
import joblib
import pandas as pd

joblib.dump(log_model, 'logistic_regression_model.pkl')
joblib.dump(dt_model, 'decision_tree_model.pkl')
X_test.to_csv('X_test.csv', index=False)
pd.DataFrame(y_pred_log, columns=['Predictions']).to_csv('y_pred_log.csv', index=False)
```

---

Step 7: Power BI Visualization (Beginner-Friendly Guide)

If you’ve **never used Power BI**, follow these steps carefully 👇

Install Power BI

* Download Power BI Desktop from the official Microsoft Store or [Power BI website](https://powerbi.microsoft.com/desktop/).

Import Data

* Open Power BI → Click **“Get Data” → “Text/CSV”**
* Select your saved files:

  * `X_test.csv`
  * `y_pred_log.csv`
  * (or the full cleaned dataset if you saved it)

Clean and Merge Data

* Go to **Power Query Editor** → Merge datasets using Employee ID or index column if available.
* Ensure columns align properly (e.g., gender, age, department, attrition).

Create Visualizations

Use the **Visualizations Pane**:

* **Bar Chart:** Count of employees who left vs stayed.
* **Pie Chart:** Attrition by department.
* **Clustered Column Chart:** Attrition by gender or age group.
* **Card Visuals:** Show metrics like accuracy, precision, recall (from Python results).

Add Filters and Slicers

* Add slicers for “Department”, “JobRole”, or “EducationField” to make it interactive.

Save Dashboard

* Save as `EmployeeAttritionDashboard.pbix`.

---

Project Deliverables

| Deliverable          | Description                                       |
| -------------------- | ------------------------------------------------- |
| ✅ Cleaned Dataset    | Final preprocessed CSV file                       |
| ✅ Python Code        | Model building and evaluation script              |
| ✅ Trained Models     | `.pkl` files (Logistic, Linear, Decision Tree)    |
| ✅ Evaluation Reports | Accuracy, Confusion Matrix, Classification Report |
| ✅ Power BI Dashboard | `.pbix` visualization file                        |

---

Tools & Technologies Used

* Programming: Python (Pandas, Scikit-learn, SHAP)
* Visualization: Power BI
* Libraries: Numpy, Pandas, Matplotlib, Joblib
* Version: Python 3.12+

---

Conclusion

This project successfully demonstrates how **machine learning can be applied to HR analytics** to predict employee attrition.
By combining Python’s analytical power and Power BI’s visualization capabilities, this project offers both **predictive insights** and **interactive dashboards** for decision-makers.

