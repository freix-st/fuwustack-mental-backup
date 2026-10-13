**Log loss** is a cost function that measures how well the predicted probabilities matches the actual classes
- How well does $\large{\hat{p}_i = y_i}$?
- $\large{i}$ - i-th observation of the data which is $\large{N}$ rows
$$\huge{\text{Log-loss} = -\frac{1}{N}\sum_{i-1}^N y_i \underbrace{\log(\hat{p}_i)}_{\substack{\text{Log probability } \\ \text{class is 1}}} + (1-y_i) \underbrace{\log(1-\hat{p}_i)}_{\substack{\text{Log probability} \\ \text{class is 0}}}}$$
For the negative sign at the start, this is because the logarithm of numbers between 0 and 1 is negative. Whatever base, whether log or ln

Example:
```
log(0.1) = -1
log(0.5) = -0.30103
log(0.8) = -0.09691
```

Without the negative sign, the loss would be a negative number that gets more negative as the prediction gets worse. Having the negative sign ensures:
- Lower values mean better predictions
- Loss is always > 0
- Loss approaches 0 for perfect predictions and grows large for bad ones

> Log-loss gets higher the more confident the model is in choosing the wrong class

For classification between Class 0 and Class 1,
- Probability of **class 1** is high, "correct" = log-loss is small
- Probability of **class 0** is high, "incorrect" = log-loss is large
## Class 1 prediction
Given that $\large{\hat{p}_i}$ approaches 1, let's use $\large{\hat{p}_i = 1}$
And because Class 1 is the correct class, then $\large{\hat{y}_i} = 1$ as well
$$\huge{\begin{matrix}
\text{Log-loss} = -\frac{1}{N}\sum_{i-1}^N (1) \log(1) + (1-1) \log(1-1) \\
\end{matrix}}$$
$$\huge{\text{Log-loss} = -\frac{1}{N}\sum_{i-1}^N 0(0) + (0) \log(0)}$$
As the probability of **Class 1** approaches 1 (100%), log-loss approaches 0.
And it's the opposite for **Class 0**.
## Optimization
Log loss can be minimized using [[Gradient descent]]

## Stratified K-fold Cross Validation
This is used to find the optimal lambda that generalizes across multiple different slices of the data.

‼️TODO: AI notes
**Why "Stratified"?:** Logistic regression is highly sensitive to class imbalance. If your target variable is rare (e.g., only 2% of users convert), a random split might result in some folds having zero positive cases. Stratification ensures that **each fold maintains the exact same percentage of classes** as the entire dataset, keeping your log-loss evaluations consistent.

```python
from sklearn.linear_model import LogisticRegressionCV
from sklearn.model_selection import StratifiedKFold

# Define your stratification strategy
cv_strategy = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)

# LogisticRegressionCV automates the search over an array of C values (1/lambda)
model = LogisticRegressionCV(
    Cs=10,                      # Tries 10 different regularization strengths
    cv=cv_strategy,             # Uses our 5-fold stratified strategy
    scoring='neg_log_loss',     # Optimizes for log-loss
    random_state=42,
    max_iter=1000
)

model.fit(X_train, y_train)

# View the best C parameter selected by cross-validation
print(f"Best C value: {model.C_[0]}")
```
