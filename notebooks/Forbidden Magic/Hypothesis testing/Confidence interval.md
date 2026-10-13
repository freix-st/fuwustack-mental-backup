A range of values which is likely to contain (in repeated sampling) the true value of an unknown statistical parameter, such as a population mean.

Helps you understand what the true population value probably is, based on your sample data.
# Bootstrap percentile method
Get a [[Bootstrap distribution]] of your data first. The statistical parameter used in generating the bootstrap distribution is the one that will be estimated by the CI.
### Calculating the tails
The tails are **excluded** from the CI. This is because they are extreme values and are thus unlikely to contain the population value for the statistic estimated.

- Alpha = 1 - Confidence Interval (ex. 0.95, 0.96, 0.99)
- Lower tail probability = alpha/2
- Upper tail probability = 1-(alpha/2)

The CI is **in-between** the tails.

**One line**
```python
ci = np.quantile(boot_distn, [alpha/2, 1-(alpha/2)])
# type(ci) == numpy.ndarray
```

**Upper and lower**
```python
lower = np.quantile(boot_distn, alpha/2)
upper = np.quantile(boot_distn, 1-(alpha/2))
```

---
## Why not 60%?

**A 60% CI means you're only 60% confident - that's too risky!**

Imagine telling your boss:

- ❌ "I'm 60% sure sales will be $40-50K" - That means 40% chance you're wrong!
- ✓ "I'm 95% sure sales will be $35-55K" - Only 5% chance you're wrong

The 60% CI is narrower (looks more precise), but it's **wrong 40% of the time** - not very useful for making decisions!

---
## Why 95%, 99%? It's convention + practicality

### Historical convention:

- **95%** became the standard in most fields (medicine, social sciences, business)
    
    - Good balance: reasonably confident, reasonably narrow
    - "Significantly confident without being paranoid"
- **99%** is used when you need extra certainty
    
    - Medical trials, safety-critical decisions
    - "We really can't afford to be wrong"
- **90%** is sometimes used for quick exploratory analysis
    
    - "Good enough for preliminary findings"

---
# Long run example

## The Process:

**Setup**: Imagine there's a true population parameter you don't know - let's say the average height of all adults is **exactly 170 cm**.

### Step-by-step what happens:

1. **Study #1**:
    - You take a random sample of 100 people
    - Calculate sample mean: 169.5 cm
    - Calculate 95% CI: [165.2, 173.8]
    - ✅ Contains 170? **YES**

2. **Study #2**:
    - Different random sample of 100 people
    - Calculate sample mean: 172.1 cm
    - Calculate 95% CI: [167.9, 176.3]
    - ✅ Contains 170? **YES**

3. **Study #3**:    
    - Different random sample of 100 people
    - Calculate sample mean: 166.8 cm
    - Calculate 95% CI: [162.5, 171.1]
    - ✅ Contains 170? **YES**

4. **Study #4**:    
    - Different random sample of 100 people
    - Calculate sample mean: 165.2 cm
    - Calculate 95% CI: [160.9, 169.5]
    - ❌ Contains 170? **NO** (this one missed!)

... continue for 96 more studies...
### After 100 studies:

- About **95 intervals** captured the true value (170 cm)
- About **5 intervals** missed it
- Success rate: **95%**

## Why does this work?
The math behind confidence intervals is designed so that the **procedure** (not any individual interval) succeeds 95% of the time. The randomness is in which **sample** you happened to draw, which affects where your interval lands.
## Key insight:

- **Before** you collect data: "If I use this method, I have a 95% chance of success"
- **After** you have your interval: "This specific interval either does or doesn't contain the truth (you just don't know which), but the method that produced it is reliable 95% of the time"