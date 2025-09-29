Titanic Dataset Exploratory Data Analysis (EDA)

Project Overview
This project performs an Exploratory Data Analysis (EDA) on the Titanic dataset to extract insights and identify patterns related to passenger survival. The analysis uses Python libraries such as **Pandas**, **Matplotlib**, and **Seaborn**.

Dataset
The dataset contains information about Titanic passengers including:

- PassengerId  
- Survived (0 = No, 1 = Yes)  
- Pclass (Passenger Class: 1, 2, 3)  
- Name  
- Sex  
- Age  
- SibSp (Number of siblings/spouses aboard)  
- Parch (Number of parents/children aboard)  
- Ticket  
- Fare  
- Cabin  
- Embarked (Port of Embarkation: C, Q, S)

Source: Kaggle Titanic Dataset (https://www.kaggle.com/c/titanic)

Tools & Libraries
- Python 3  
- Pandas  
- Matplotlib  
- Seaborn  
- Google Colab or Jupyter Notebook

Steps Performed
1. Data Loading & Exploration
   - Loaded the dataset and explored basic information using `.info()`, `.describe()`, and `.value_counts()`.

2. Handling Missing Data
   - Checked for missing values and handled them if needed (e.g., Age, Cabin, Embarked).

3. Visualizations
   - Histograms for numeric columns like Age and Fare.
   - Boxplots to detect outliers and compare groups.
   - Scatterplots to see relationships between numeric variables.
   - Countplots for categorical variables (Survived, Pclass, Sex, Embarked).
   - Correlation heatmap and pairplot for numeric variable relationships.

4. Observations
   - Survival is highly influenced by **Sex** and **Passenger Class**.
   - Females had higher survival rates than males.
   - 1st class passengers had higher survival chances.
   - Fare is correlated with class and survival probability.
   - Age shows slight influence; younger passengers had slightly higher survival chances.

5. Summary
   - Key trends and relationships identified.
   - Visualizations support insights.
   - Provides groundwork for predictive modeling.

How to Run
1. Open the notebook in **Google Colab** or **Jupyter Notebook**.  
2. Upload the Titanic dataset CSV file.  
3. Run the cells sequentially to see outputs and visualizations.  
4. Export notebook as PDF for the full report.


