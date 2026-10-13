# Generating a bootstrap distribution

Example DataCamp code:
```python
import numpy as np
# Step 3. Repeat steps 1 & 2 many times, appending to a list
so_boot_distn = []
for i inrange(5000):
    so_boot_distn.append(
	    # Step 2. Calculate point estimate
	    np.mean(
	        # Step 1. Resample
	        stack_overflow.sample(frac=1, replace=True)['converted_comp']
	    ))
```
- If bootstrapping median, use np.median

---

Steps:
1. Generate 1 bootstrap resample
2. Calculate the mean for one column of the resample
3. Replicate N times and put it in an array
## Step-by-step through an example

### Step 1: Resample with replacement
```python
spotify_1_resample = spotify_sample.sample(frac=1, replace=True)
```
- **`frac=1`**: Sample a fraction of 1.0 (100%) of the rows
    - `frac=0.5` would sample 50% of rows
    - `frac=1` samples the same number of rows as the original DataFrame
- **`replace=True`**: Sample **with replacement**
    - Rows can be selected multiple times
    - Some original rows might appear 0 times, others might appear 2+ times

This creates a **bootstrap sample** - a resampled dataset with the same size as the original, but with some rows duplicated and others omitted.

### Step 2: Calculate the mean for one column of the resample
```python
mean_danceability_1 = np.mean(spotify_1_resample['danceability'])
```
This will generate an int value. In this example: `0.5910226305934319`

### Step 3: Replicate N times and put it in an array
```python
mean_danceability_1000 = []
for i in range(1000):
	mean_danceability_1000.append(
        np.mean(spotify_sample.sample(frac=1, replace=True)['danceability'])
	)
```
This will generate an array of means that represents the bootstrap distribution.

### (Optional) Plot the distribution
```python
plt.hist(mean_danceability_1000)
plt.show()
```

Example plot:
![[example_bootstrap_dist_plot.png]]
