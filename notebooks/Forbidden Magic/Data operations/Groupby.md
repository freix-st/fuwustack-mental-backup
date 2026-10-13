From DataCamp code:
```python
result = df.groupby(['decade', 'category', 'sex']).sum()
```

‼️TODO: AI notes
## Visual comparison:

**With `as_index=True` (default):**
```
                        value
decade category sex          
1990   A        F         20
                M         10
       B        M         50
2000   A        M         30
       B        F         60
```

**With `as_index=False`:**
```
   decade category sex  value
0    1990        A   F     20
1    1990        A   M     10
2    1990        B   M     50
3    2000        A   M     30
4    2000        B   F     60
```

## How to access MultiIndex levels:

```python
import pandas as pd

df = pd.DataFrame({
    'decade': [1990, 1990, 2000, 2000],
    'category': ['A', 'A', 'B', 'B'],
    'sex': ['M', 'F', 'M', 'F'],
    'value': [10, 20, 30, 40]
})

result = df.groupby(['decade', 'category', 'sex']).sum()

# ❌ This WON'T work - category is not a column anymore
# result['category']  # KeyError!

# ✅ Access index level values:
result.index.get_level_values('category')
result.index.get_level_values('decade')
result.index.get_level_values(1)  # By position (category is position 1)

# ✅ Convert index back to columns:
result.reset_index()  # Now decade, category, sex are columns again
result.reset_index(level='category')  # Just convert 'category' back to column

# ✅ Filter by index level:
result.loc[(1990, 'A')]  # Filter by (decade, category)
result.xs('A', level='category')  # Cross-section: all rows where category='A'
```

## Key distinction:

- **`as_index=True`**: `decade`, `category`, `sex` are **index levels** → use `.index.get_level_values()` or `.reset_index()`
- **`as_index=False`**: `decade`, `category`, `sex` are **columns** → use `df['category']`

If you want easy column access after groupby, either use `as_index=False` or call `.reset_index()` afterwards!