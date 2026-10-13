# Packages in pip to install
```sh
pip install transformers
pip install datasets
```

# Downloading a dataset
```python
from datasets import load_dataset

data = load_dataset("IVN-RIN/BioBERT_Italian", split="train")
```
- Other split: validation

Most datasets in will be using **Apache Arrow** rather than pandas DataFrames
```python
filtered = data.filter(lambda row: " bella " in row['text'])
sliced = filtered.select(range(2))
```

