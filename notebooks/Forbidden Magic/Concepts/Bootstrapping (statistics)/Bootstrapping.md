Used to estimate properties of a population when data is limited

1. **Resample (usually with replacement)** until the same size as the original dataset
2. **Calculate the statistic of interest** (mean, median, etc.) from the resampled data
3. **Note down the computed statistic** as a data point for a distribution
4. **Repeat** until you have a large enough distribution (usually thousands of iterations)
5. **Analyze** the resulting distribution

**Why resample with replacement?**
If we sample without replacement, then this results in just a shuffled dataset. The point of having replacement is so that each bootstrap resample would be slightly different. This creates variability that is needed for estimating properties of the population.