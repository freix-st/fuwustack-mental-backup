# Pre-processing
## Standardization
[[Standardization]] can speed up gradient descent if numerical values have wildly different scales
# Training
```python
import pandas as pd
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler

from sklearn.metrics import log_loss
import matplotlib.pyplot as plt

X = np.asarray(df.drop(columns=['target_label']))
y = np.asarray(df['target_label'])

X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2,random_state=42)
# don't forget to stratify=y if needed

model = LogisticRegression(max_iter=2000).fit(X_train,y_train)
# model = LogisticRegression(solver="saga", max_iter=10000).fit(X_train,y_train)
```
# Performance

## Log loss
```python
yhat = model.predict(X_test)
yhat_prob = model.predict_proba(X_test)

log_loss(y_test, yhat_prob)
# print if not notebook
```
## Visualize coefficients
With matplotlib
```python
features = train_df.drop(columns="Transported").columns
coefficients = pd.Series(model.coef_[0], index=features)

plt.figure(figsize=(9, 7))
coefficients.sort_values().plot(kind='barh')
plt.title("Feature Coefficients")
plt.xlabel("Coefficient Value")

plt.tight_layout()
plt.show()
```

With seaborn
```python
features = train_df.drop(columns="Transported").columns
coefficients = pd.Series(model.coef_[0], index=features).sort_values()

plt.figure(figsize=(14, 7))
ax = sns.barplot(x=coefficients.values,
            y=coefficients.index,
            hue=coefficients.index, palette="icefire")

padding = 0.0015
plt.xlim(coefficients.min() - padding, coefficients.max() + padding)
for container in ax.containers:
    ax.bar_label(container, fmt="%.7f", padding=5)

plt.title("Feature Coefficients", fontsize=14, pad=15)
plt.xlabel("Coefficient Value", fontsize=12)
plt.ylabel("Features", fontsize=12)

plt.tight_layout()
plt.show()
```
# Prediction
- Standardize the test set but make sure to use `transform()` and not `fit_transform()` so that the global mean and standard deviation are preserved

## Kaggle submission
Prediction
```python
# as part of processing, test_processed_df should not have the ID column
submit_X = np.asarray(test_processed_df)

# make sure that the submission has the correct data type
# expected by the kaggle challenge
submission_pred = model.predict(submit_X)
#submission_pred = model.predict(submit_X).astype(bool)
```

Convert the prediction to dataframe and preview to make sure it matches the submission sample
```python
submission_df = pd.DataFrame({
    'PassengerId': test_df['PassengerId'],
    'Transported': submission_pred
})

submission_df.head()
```

Create csv
```python
submission_df.to_csv('submission.csv', index=False)
```