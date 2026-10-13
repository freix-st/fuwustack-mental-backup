## Fill all null with value
### Generic
```python
train_df['Cabin_Num'] = train_df['Cabin_Num'].fillna(0.0)

# ...

train_df.fillna(value={
    'FoodCourt': 0.0,
    'RoomService': 0.0,
    'ShoppingMall': 0.0,
    'Spa': 0.0,
    'VRDeck': 0.0,
    'Cabin_Size': 1.0
}, inplace=True)
```
### Age
```python
overall_median_age = train_df['Age'].median()
train_df.loc[train_df['HomePlanet'].isnull(), 'Age'] = train_df.loc[train_df['HomePlanet'].isnull(), 'Age'].fillna(overall_median_age)

# Conditional (relying on other features)
train_df['Age'] = train_df['Age'].fillna(train_df.groupby(['HomePlanet', 'VIP'])['Age'].transform('median'))

# General or leftovers from conditional
train_df['Age'] = train_df['Age'].fillna(overall_median_age)
```

## Drop row if value for feature is null
```python
train_df.dropna(subset=['HomePlanet'], inplace=True)
```
