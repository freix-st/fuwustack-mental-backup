# Columns
## Drop columns
```python
drop_cols = [
    'Cabin',
    'Name'
]

train_df.drop(columns=drop_cols, inplace=True)
```

# Conversion
## True-False to numerical
Given that:
```python
 6   VIP           8490 non-null   object
 13  Transported   8693 non-null   bool
```

```python
# String --> bool --> int
train_df['VIP'] = train_df['VIP'].astype(bool).astype(int)

# bool --> int
train_df['Transported'] = train_df['Transported'].astype(int)
```
## One-hot encoding
```python
from sklearn.preprocessing import OneHotEncoder

encoder = OneHotEncoder(sparse_output=False, dtype=float)

encode_cols = [
    'HomePlanet',
    'Destination',
    'Cabin_Deck',
    'Cabin_Side'
]

encoded_data = encoder.fit_transform(train_df[encode_cols])
encoded_df = pd.DataFrame(encoded_data, columns=encoder.get_feature_names_out(encode_cols))
train_df = pd.concat([train_df.drop(encode_cols, axis=1), encoded_df], axis=1)
```