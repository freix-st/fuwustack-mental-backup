# Z-score

## General standardization
> The z-score tells you how many standard deviations a value is away from the mean

```js
z = (x - μ) / σ
```

Where:
- x = individual value
- μ = population mean
- σ = population standard deviation

**Why?** This removes units and makes different variables comparable. For example:
- Height in cm: mean=170, std=10 → someone at 180cm has z=1.0
- Weight in kg: mean=70, std=15 → someone at 85kg has z=1.0
- Both are "1 standard deviation above average" despite different units

## Hypothesis testing standardization
> The z-score tells you how many standard errors the sample statistic is away from the hypothesized value.

```js
z = (sample statistic - hypothesized value) / standard error
```

Computing this Z-score needs a [[Bootstrap distribution]]
## From DataCamp exercise

```python
# Hypothesize that the proportion is 6%
# Hypothesized value
# Set up the null hypothesis
prop_hyp = 0.06

# Calculate the standard error
std_error = np.std(boot_distn, ddof=1)

# Find z-score of prop_samp
# prop_samp is a sample mean in the bootstrap distribution
# remember that the bootstrap distribution here is made of means
z_score = (prop_samp - prop_hyp) / std_error

# Print z_score
print(z_score)
```
## Standard normal (z) distribution

---
# Normalization vs Standardization
‼️TODO: AI notes
## Normalization (Min-Max Scaling)

- Scales data to a **fixed range**, typically **[0, 1]**
- Formula: `(x - min) / (max - min)`
- All values end up between 0 and 1
- **Sensitive to outliers** (they compress the rest of the data)

## Standardization (Z-score normalization)

- Centers data around **mean = 0** with **standard deviation = 1**
- Formula: `(x - mean) / std_dev`
- Values can be **any range** (including negative)
- **Less sensitive to outliers**

## When to use each:

- **Normalization**: When you need bounded values (e.g., neural networks, image processing)
- **Standardization**: When you assume normal distribution or use algorithms sensitive to feature scale (e.g., PCA, linear regression, SVM)
# Standardization Changes Scale, Not Shape
‼️TODO: AI notes

Standardization is a **linear transformation** (shift + scale), so:

- ✅ **Centers** the distribution at 0
- ✅ **Scales** it so std dev = 1
- ❌ **Does NOT change the shape**

## What this means for histograms:

**Normal distribution → Still normal (bell curve)**

- Just centered at 0 instead of the original mean
- Width adjusted to std dev = 1
- Classic bell curve shape preserved

**Skewed distribution → Still skewed**

- Right-skewed stays right-skewed
- Left-skewed stays left-skewed
- Same asymmetry, different scale

**Uniform distribution → Still uniform**

- Flat histogram shape preserved

**Bimodal → Still bimodal**

- Two peaks remain

## Visual Example:

```
Before standardization (mean=50, std=10):
    │     ╱╲
    │    ╱  ╲
    │   ╱    ╲___
   ─┼──────────────
    20  50   80

After standardization (mean=0, std=1):
    │     ╱╲
    │    ╱  ╲
    │   ╱    ╲___
   ─┼──────────────
   -3   0    3
```

**The shape stays the same, only the x-axis values change!**

If you want to make data normally distributed, you'd need **normalization techniques** like Box-Cox or log transforms, not standardization.