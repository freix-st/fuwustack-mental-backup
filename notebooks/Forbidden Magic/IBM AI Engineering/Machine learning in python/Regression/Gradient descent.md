# Overview
Iterative approach to finding the minimum of a function
- Adjusts parameters using log-loss (or other cost function like MSE) derivative
- Depends on the specified learning rate

The goal is to change the parameter values and find path to optimal parameters to minimize the cost function.

![[gradient_descent_loss.png|553]]

## On larger datasets
- Calculated over entire dataset
- Large data set = slow descent
- Converge less likely as steps too big to notice minima

# Stochastic Gradient Descent (SGD)
- Variation of gradient descent
- Uses a random subset of the data
- Likely to overlook local minima, and find the global minima
- Converges quickly to a global minimum

Convergence can be improved by:
- Decreasing the learning rate
- Gradually increasing sample size