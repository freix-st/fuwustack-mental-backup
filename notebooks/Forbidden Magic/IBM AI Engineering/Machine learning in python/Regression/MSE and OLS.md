Mean Squared Error and Ordinary Least Squares
# Linear regression
The best-fit line is found by minimizing the amount of error (distance of the line to the data points)

![[simple_regression_errors.png|411]]

Average of all residual errors measures how poorly the line is fit to the data. This is represented through the equation **Mean Squared Error (MSE)**
$$\huge{MSE = \frac{1}{n}\sum_{i=1}^n(y_i - \hat{y}_i)^2}$$

For multiple regression, $\large{\frac{1}{n}}$ is removed for human convenience (clean derivatives). It can be retained in code for clarity/legibility
```python
# With 1/n
loss = np.mean((y - y_pred) ** 2)

# Without 1/n
loss = np.sum((y - y_pred) ** 2)
```
Using sum instead of mean in code can also cause the sum of squared errors to be so big that it overflows float32

# OLS regression
Ordinary Least Squares regression estimates the coefficients by minimizing the MSE
Accuracy can be greatly reduced by outliers

[[Gradient descent]] starts optimization with random values for each coefficient

For Python, scikit-learn's `LinearRegression()` class makes use of OLS under the hood to estimate the coefficients

NOTE: OLS may inaccurately weigh outliers, resulting in skewed outputs