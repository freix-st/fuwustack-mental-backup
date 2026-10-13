## Comparing different regression types

|Model Name|Description|Code Syntax|
|---|---|---|
|Simple linear regression|**Purpose:** To predict a dependent variable based on one independent variable.<br><br>**Pros:** Easy to implement, interpret, and efficient for small datasets.<br><br>**Cons:** Not suitable for complex relationships; prone to underfitting.<br><br>**Modeling equation:** y = b0 + b1x|1. from sklearn.linear_model import LinearRegression<br>    <br>2. model = LinearRegression()<br>    <br>3. model.fit(X, y)|
|Polynomial regression|**Purpose:** To capture nonlinear relationships between variables.<br><br>**Pros:** Better at fitting nonlinear data compared to linear regression.<br><br>**Cons:** Prone to overfitting with high-degree polynomials.<br><br>**Modeling equation:** y = b0 + b1x + b2x2 + ...|1. from sklearn.preprocessing import PolynomialFeatures<br>    <br>2. from sklearn.linear_model import LinearRegression<br>    <br>3. poly = PolynomialFeatures(degree=2)<br>    <br>4. X_poly = poly.fit_transform(X)<br>    <br>5. model = LinearRegression().fit(X_poly, y)|
|Multiple linear regression|**Purpose:** To predict a dependent variable based on multiple independent variables.<br><br>**Pros:** Accounts for multiple factors influencing the outcome.<br><br>**Cons:** Assumes a linear relationship between predictors and target.<br><br>**Modeling equation:** y = b0 + b1x1 + b2x2 + ...|1. from sklearn.linear_model import LinearRegression<br>    <br>2. model = LinearRegression()<br>    <br>3. model.fit(X, y)|
|Logistic regression|**Purpose:** To predict probabilities of categorical outcomes.<br><br>**Pros:** Efficient for binary classification problems.<br><br>**Cons:** Assumes a linear relationship between independent variables and log-odds.<br><br>**Modeling equation:** log(p/(1-p)) = b0 + b1x1 + ...|1. from sklearn.linear_model import LogisticRegression<br>    <br>2. model = LogisticRegression()<br>    <br>3. model.fit(X, y)|

## Associated functions commonly used

|Function/Method Name|Brief Description|Code Syntax|
|---|---|---|
|train_test_split|Splits the dataset into training and testing subsets to evaluate the model's performance.|1. from sklearn.model_selection import train_test_split<br>    <br>2. X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)|
|StandardScaler|Standardizes features by removing the mean and scaling to unit variance.|1. from sklearn.preprocessing import StandardScaler<br>    <br>2. scaler = StandardScaler()<br>    <br>3. X_scaled = scaler.fit_transform(X)|
|log_loss|Calculates the logarithmic loss, a performance metric for classification models.|1. from sklearn.metrics import log_loss<br>    <br>2. loss = log_loss(y_true, y_pred_proba)|
|mean_absolute_error|Calculates the mean absolute error between actual and predicted values.|1. from sklearn.metrics import mean_absolute_error<br>    <br>2. mae = mean_absolute_error(y_true, y_pred)|
|mean_squared_error|Computes the mean squared error between actual and predicted values.|1. from sklearn.metrics import mean_squared_error<br>    <br>2. mse = mean_squared_error(y_true, y_pred)|
|root_mean_squared_error|Calculates the root mean squared error (RMSE), a commonly used metric for regression tasks.|1. from sklearn.metrics import mean_squared_error<br>    <br>2. import numpy as np<br>    <br>3. rmse = np.sqrt(mean_squared_error(y_true, y_pred))|
|r2_score|Computes the R-squared value, indicating how well the model explains the variability of the target variable.|1. from sklearn.metrics import r2_score<br>    <br>2. r2 = r2_score(y_true, y_pred)|