## List columns with null
```python
train_df.isnull().sum()[lambda x : x > 0]
```

## Plot null vs non-null
```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.heatmap(df.isnull(), cbar=False, yticklabels=False, cmap='viridis')
plt.show()
```