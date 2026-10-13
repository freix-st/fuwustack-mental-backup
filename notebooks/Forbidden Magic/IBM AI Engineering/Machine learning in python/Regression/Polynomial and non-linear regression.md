**Non-linear regression**
- Complex relationship between variables
- Real world data usually is more commonly best fit using a curve than a line
- Bases inputs on functions of given features (ex. `exp` or `log` of the features)
- Can model relationships that are exponential, logarithmic, sinusoidal, etc.

**Polynomial regression**
- A special case of multiple linear regression
- Uses linear regression to fit data to polynomial expressions of given features 

![[polynomial_regression_curves.png]]

Relationship between independent variable X and dependent variable y is modeled as an nth degree polynomial in X

**Cubic**
$$\huge{\hat{y} = \beta_0 + \beta_1 x + \beta_2 x^2 + \beta_3 x^3}$$
If we perform a substitution of x as exponentials: $$\huge{\begin{matrix} x_1 = x \\ x_2 = x^2 \\ x_3 = x^3 \end{matrix}}$$
Then this would result in the linear regression equation!
$$\huge{\hat{y} = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \beta_3 x_3}$$

This equation is **non-linear with respect to the feature $x$** (because of the exponents), but it is **linear with respect to the coefficients ($\beta$)**.

### What does this mean for Scikit-Learn?

It means scikit-learn doesn't have a `PolynomialRegression` model. Instead, you use a helper tool called **`PolynomialFeatures`** to engineer those $x^2$ and $x^3$ columns first, and then you dump that expanded dataset into the exact same `LinearRegression()` model you are already using.

Here is how the code actually looks:

```python
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression

# 1. Start with your 1D array: [ [x] ]
X_train_1 = X_train[:, 0].reshape(-1, 1)

# 2. Transform the data to include x^2 and x^3
# If input is [3], it outputs [1, 3, 9, 27] (includes x_0, x_1, x_2, x_3)
poly = PolynomialFeatures(degree=3, include_bias=True)
X_poly = poly.fit_transform(X_train_1)

# 3. Feed the fake "independent" features into ordinary Linear Regression
regressor = LinearRegression(fit_intercept=False) # False because poly generated x_0=1 for us!
regressor.fit(X_poly, y_train)

# Now you have 4 coefficients!
print("Coefficients (Beta 0, 1, 2, 3):", regressor.coef_)
```

# Models

- Regression Trees
- Random Forests
- Neural Networks
- Support Vector Machines
- Gradient Boosting Machines
- K-Nearest Neighbors