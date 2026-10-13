This helps with data where the scales of the numerical columns are different/inconsistent where some may be very large while some are tiny

ex. Col A: 10000-100000 and Col B:0.002-0.1

This should only be applied to **continuous columns** - columns representing a continuous stream of numbers. Because of this, if any continuous columns are based on computing other existing columns, add those first before standardizing.

Python: `StandardScaler`

During training:
```python
from sklearn.preprocessing import StandardScaler

continuous_columns = df.select_dtypes(include=['float64']).columns.tolist()

scaler = StandardScaler()
scaled_features = scaler.fit_transform(df[continuous_columns])
scaled_df = pd.DataFrame(scaled_features, columns=scaler.get_feature_names_out(continuous_columns))

df = pd.concat([df.drop(columns=continuous_columns), scaled_df], axis=1)
```

During prediction, make sure to use just `transform()` so that the mean and standard deviation from training is reused. Also make sure to use the same columns as during training
```python
test_scaled_features = scaler.transform(test_df[continuous_columns])

test_scaled_df = pd.DataFrame(
    test_scaled_features, 
    columns=scaler.get_feature_names_out(continuous_columns)
)

test_processed_df = pd.concat(
    [test_df.drop(columns=continuous_columns), test_scaled_df], 
    axis=1
)
```

---
## Basic visualization
```python
import seaborn as sns
import matplotlib.pyplot as plt

plt.figure(figsize=(10, 6))
sns.boxplot(data=train_df)
plt.title("Scale difference check")
plt.xticks(rotation=90)
plt.show()
```

## Visualize before and after
Pre-requisite (only for the plots)
```python
import seaborn as sns
import matplotlib.pyplot as plt
```

To get the comparison, we need to have a separate variable for the standardized set
```python
continuous_columns = train_df.select_dtypes(include=['float64']).columns.tolist()

scaler = StandardScaler()
scaled_features = scaler.fit_transform(train_df[continuous_columns])
scaled_df = pd.DataFrame(scaled_features, columns=scaler.get_feature_names_out(continuous_columns))
processed_df = pd.concat([train_df.drop(columns=continuous_columns), scaled_df], axis=1)
```

Then the actual visualization code
```python
fig, axes = plt.subplots(2, 1, figsize=(12, 5))

sns.boxplot(
    data=train_df[continuous_columns],
    ax=axes[0],
    orient='h',
)
axes[0].set_title("Original Scale")
axes[0].tick_params(axis='x')
axes[0].set_xlim(-1000, 30000)

sns.boxplot(
    data=processed_df[continuous_columns],
    ax=axes[1],
    orient='h',
)
axes[1].set_title("Standardized")
axes[1].tick_params(axis='x')
axes[1].set_xlim(-1.3, 41)

plt.tight_layout()
plt.show()
```

After visualization, assign the scaled df to the actual df
```python
train_df = processed_df
```

---

Many ML algorithms are highly sensitive to the scale of the input features.

If one feature has values ranging from 0 to 1 and another ranges from 0 to 1,000,000, the algorithm will often assume the larger feature is vastly more important, even if it isn't. 

Standardization transforms the data so that each feature has a mean of 0 and a standard deviation of 1.
$$\huge{z = \frac{x - \mu}{\sigma}}$$
Where $\mu$ is the mean and $\sigma$ is the standard deviation.
# Core reasons
### Helps with distance-based metrics
Algorithms that compute distance between data points
examples:
- K-nearest neighbors (KNN)
- K-means clustering
- Support Vector Machines (SVM)
### Speeds up gradient descent optimization
When features have very different scales, the feature that uses larger numbers will pull the cost function in one direction, elongating it like a steep narrow valley. 

This will make gradient descent oscillate wildly back and forth, taking a long time to converge.

Standardization will make the cost function symmetric (spherical), speeding up gradient descent.

examples:
- Linear regression
- Logistic regression
- Neural networks
### Required for variance-driven dimensionality reduction
When algorithms look specifically for where the "maximum variance" is in the dataset

example:
- Principal Component Analysis (PCA)
# When to skip
Not needed for **Tree-based models**
- Decision Trees
- Random Forest
- Gradient Boosting
- XGBoost