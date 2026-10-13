### 1. **The spread shows uncertainty**

- **Wide distribution** → High uncertainty. Your sample mean could vary a lot if you had sampled different people
- **Narrow distribution** → Low uncertainty. You'd likely get similar means even with different samples
- The standard deviation of this distribution is the **standard error** of the mean

**Example:**

- **Wide**: Bootstrap means range from 160-180 cm (std dev = 5 cm) → "My estimate could easily be off by several centimeters"
- **Narrow**: Bootstrap means range from 169-171 cm (std dev = 0.5 cm) → "My estimate is quite precise, likely within 1 cm of the truth"

### 2. **The center confirms your estimate**

- The middle of the bootstrap distribution should be close to your original sample mean
- This is your best estimate of the population mean

**Example:**

- Original sample mean: **170 cm**
- Mean of 10,000 bootstrap means: **170.1 cm**
- **Interpretation**: The bootstrap process confirms 170 cm is a reasonable estimate

### 3. **Percentiles give confidence intervals**

- Take the 2.5th and 97.5th percentiles of your bootstrap means
- This gives you a **95% confidence interval** for the population mean

**Example:**

- 2.5th percentile: **168.2 cm**
- 97.5th percentile: **171.8 cm**
- **Interpretation**: "I'm 95% confident the true population mean height is between 168.2 and 171.8 cm"

### 4. **The shape reveals distributional properties**

- Symmetric → Normal-like behavior
- Skewed → Your estimator might be biased or the data is skewed

**Example:**

- **Symmetric**: Bootstrap means form a nice bell curve centered at 170 cm → The mean behaves predictably
- **Right-skewed**: Bootstrap means cluster at 170 cm but have a long tail to 180 cm → The underlying data might have outliers pulling the mean upward; consider using median instead