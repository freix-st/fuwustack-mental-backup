# Basic types
**Simple linear regression**
- Single independent variable estimates the dependent variable
- Linear relationship between explanatory features and continuous target variable
**Simple non-linear regression**
- Non-linear relationship
**Multiple regression**
- More than one independent variable

# Application
Used when we want to estimate a continuous value
ex. Sales forecasting, price estimation, predictive maintenance, employment income, rainfall estimation, wildfire probability and severity, spread of infectious disease, risk of chronic disease

# Algorithms
- Linear and polynomial
- Random forest
- Extreme gradient boosting (XGBoost)
- K-nearest neighbors (KNN)
- Support vector machines (SVM)
- Neural networks

---
# Linear regression
Linear relationship between explanatory features and continuous target variable
You can determine the "best-fit" line with the data

![[simple_regression_best_fit.png]]

Linear regression uses the cost function [[MSE and OLS]].

---
# Simple linear regression

$$\huge{ \hat{y} = \beta_0 + \beta_1x_1 }$$

- **$\hat{y}$ (y-hat):** This is the **predicted value** or the dependent variable. It is what you are trying to calculate.

- **$\beta_0$:** This is the **y-intercept**. It represents the value of $y$ when $x_1$ is zero. In geometry, this is where the line crosses the vertical axis.

- **$\beta_1$:** This is the **slope** (or coefficient). It tells you how much $y$ is expected to increase (or decrease) for every one-unit increase in $x_1$.

- **$x_1$:** This is the **independent variable** or the input feature you are using to make the prediction.

$\theta_0$ and $\theta_1$ are called the coefficients of linear regression, selected by the model for the best-fit line

---
# Multiple linear regression

$$\huge{\hat{y}=\beta_0 + \beta_1 x_1 + \beta_2 x_2 + \cdots + \beta_n x_n}$$

Feature vectors
$\large{X = [1, x_1, x_2, \cdots, x_n]}$
*The 1 at the start is to accommodate the fact that the first will pair with $\beta_0$, the y-intercept* 

Weights
$\large{ \beta = \begin{bmatrix} \beta_0 \\ \beta_1 \\ \vdots \\ \beta_n \end{bmatrix} }$

Vector form
$\large{ \hat{y} = X \beta }$

### Downsides of multiple linear regression
- May be considering impossible scenarios
- Extrapolating scenarios
- Model might depend on a group of correlated or colinear variables
### Correlated variables
When the features have a linear relationship with each other, they are no longer independent variables. The variables predict each other.

In the event that you want to hold all the variables constant and only one changes, it's not feasible if there are correlated variables. This is because the correlated variable must also change in a real scenario.
### To avoid pitfalls of correlated variables
- Remove redundant variables
- Select variables that are:
	- most understood
	- controllable
	- most correlated with the target

---
# Plotting linear regression models

When plotting the regression line, we use the following code:
```python
plt.scatter(X_train_1, y_train,  color='blue')
plt.plot(X_train_1, intercept_[0] + coef_1[0,0] * X_train_1, '-r')
plt.xlabel("Engine size")
plt.ylabel("Emission")
```

The `plt.plot()` part uses the linear regression equation:
$$\huge{\hat{y} = \underbrace{\beta_0}_{\text{intercept\_}}} \cdot \underbrace{x_0}_1 + \underbrace{\beta_1}_{\text{coef\_}} \cdot \underbrace{x_1}_{\text{X\_train\_1}} $$
Since $\large{x_0}$ is always 1, we can leave it out of the equation.