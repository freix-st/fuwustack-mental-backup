### 1. **The spread shows uncertainty**

- Same concept, but medians are often **more stable** (less affected by outliers)
- The spread depends heavily on the **density of data near the middle**

**Example:**

- **Mean bootstrap**: Ranges from 160-180 cm (std dev = 5 cm) - sensitive to extreme values
- **Median bootstrap**: Ranges from 168-172 cm (std dev = 1 cm) - more stable because outliers don't affect it
- **Interpretation**: "The median is more precisely estimated than the mean because it's robust to the few very tall/short people in my sample"

### 2. **The center confirms your estimate**

- Same idea: bootstrap median distribution centers around your sample median

**Example:**

- Original sample median: **169 cm**
- Mean of 10,000 bootstrap medians: **169 cm**
- **Interpretation**: Same as before - confirms your estimate

### 3. **Percentiles give confidence intervals**

- Same approach, now for the population median

**Example:**

- 2.5th percentile: **167 cm**
- 97.5th percentile: **171 cm**
- **Interpretation**: "I'm 95% confident the true population median height is between 167 and 171 cm"

### 4. **The shape reveals distributional properties** ⚠️ **THIS IS WHERE IT DIFFERS!**

- Median distributions are often **discrete/steppy** rather than smooth
- Can be **asymmetric** even when mean distributions are symmetric
- May have **gaps or multiple peaks** if there are ties in the data

**Example:**

- **Mean bootstrap**: Smooth bell curve from 168-172 cm
- **Median bootstrap**: Jumps between discrete values like 168, 169, 170, 171 cm with gaps in between (because the median can only take values that exist in your sample, or averages of adjacent values)
- **Interpretation**: "The choppiness is normal for medians with small samples - it doesn't indicate a problem"

## Why the differences?

- **Mean** is calculated from all values → smoother bootstrap distribution
- **Median** only uses middle value(s) → more discrete, can jump between actual data points

The bootstrap still works great for medians, but the distribution looks different!