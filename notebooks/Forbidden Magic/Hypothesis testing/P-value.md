# P-value from Z-score
```python
from scipy.stats import norm

p_value = 1 - norm.cdf(z_score, loc=0, scale=1)
```
# The Relationship with Z-score

**Z-score** → **how far** from the mean (in standard deviations)  
**P-value** → **how rare** that distance is (probability)

# Key Insight
p-value doesn't tell you if the null hypothesis is true. It tells you **how compatible your data is IF it was true**.

- Low p-value = "My data looks **weird** if the null is true"
	- Data is surprising if null is true → evidence against the null
	- **p < 0.05**:  Considered statistically significant — reject the null
- High p-value = "My data looks **normal** if the null is true"
	- Data is typical if null is true → no strong evidence against it
	- **p ≥ 0.05**: Not enough evidence to reject the null hypothesis
# Example

**Hypothesis**: A coin is fair (null hypothesis)
You flip it 100 times and get 65 heads.

**p-value ≈ 0.003** means:
- "If the coin were truly fair, there's only a 0.3% chance of getting 65+ heads"
- This is very unlikely, so we reject the idea that the coin is fair

**What p-value is NOT**
❌ The probability that the null hypothesis is true  
❌ The probability you made a mistake  
❌ The size or importance of an effect  
❌ The probability your results happened by chance