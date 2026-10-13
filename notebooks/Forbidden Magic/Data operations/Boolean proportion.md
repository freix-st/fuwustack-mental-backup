From the DataCamp code:
```python
# Calculate the proportion of late shipments
late_prop_samp = (late_shipments['late'] == 'Yes').mean()
```

‼️ TODO: AI notes
When you perform mathematical operations on boolean values:

- `True` is treated as `1`
- `False` is treated as `0`

So when you take the mean of a boolean series, you're actually calculating:

```
(number of True values) / (total number of values)
```

Which is exactly the definition of a proportion!

## Example:

```python
# Let's say you have:
late_shipments['late'] == 'Yes'
# This might produce: [True, False, True, True, False]

# When you call .mean() on this, it's equivalent to:
# [1, 0, 1, 1, 0]
# Mean = (1 + 0 + 1 + 1 + 0) / 5 = 3/5 = 0.6

# So 0.6 (or 60%) of shipments were late
```

## Why this works:

The **mean** (average) of 1s and 0s gives you the **proportion** of 1s:

- If all values are True (1): mean = 1.0 (100%)
- If half are True: mean = 0.5 (50%)
- If none are True: mean = 0.0 (0%)

This is a very common pattern in data analysis because it's concise and readable. Instead of writing:

```python
len(late_shipments[late_shipments['late'] == 'Yes']) / len(late_shipments)
```

You can just write:

```python
(late_shipments['late'] == 'Yes').mean()
```