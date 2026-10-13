### 1. **The spread shows uncertainty** ⚠️ **Often VERY unstable**

- Mode can **jump around dramatically** between bootstrap samples
- With continuous or near-continuous data, every value might appear only once → no clear mode
- Spread is often **not meaningful** because the mode is so discrete

**Example:**

- **Mean bootstrap**: Smoothly ranges from 168-172 cm
- **Median bootstrap**: Jumps between 168, 169, 170, 171 cm
- **Mode bootstrap**: Chaotically jumps between 165, 167, 170, 173, 175 cm with no pattern
- **Interpretation**: "The mode is too unstable to estimate reliably - my sample might just not have enough repeated values"

### 2. **The center confirms your estimate** ⚠️ **May NOT center on sample mode!**

- The most common bootstrap mode might be **different** from your sample mode
- This is a red flag that mode isn't a good statistic for your data

**Example:**

- Original sample mode: **170 cm** (appeared 3 times)
- Bootstrap modes: 168 cm (2000 times), 169 cm (2500 times), 170 cm (1800 times), 171 cm (2100 times), others (1600 times)
- **Interpretation**: "No consistent mode emerges - the original mode was likely just random chance"

### 3. **Percentiles give confidence intervals** ⚠️ **Often meaningless**

- Hard to interpret when the mode is all over the place
- May give a huge, uninformative interval

**Example:**

- 2.5th percentile: **162 cm**
- 97.5th percentile: **178 cm**
- **Interpretation**: "This huge range tells me the mode is too unstable to estimate - I should use mean or median instead"

### 4. **The shape reveals distributional properties** - **EXTREMELY discrete & spiky**

- Will have **sharp spikes** at specific values
- Often **multimodal** (multiple peaks) even if the population isn't
- May be **uniform** (flat) if no value dominates

**Example:**

- Multiple sharp spikes at 167, 168, 169, 170, 171 cm, each appearing in 15-20% of bootstrap samples
- **Interpretation**: "No single mode dominates → the data doesn't have a strong mode to begin with"

## When bootstrapping mode fails:

1. **Continuous data**: Heights measured precisely (170.3, 170.5 cm) → almost no ties → no meaningful mode
2. **Small samples**: Not enough data for any value to appear frequently
3. **Uniform-ish distributions**: No value is clearly most common

## When it might work:

- **Categorical data**: Colors (red, blue, green) where values naturally repeat
- **Discrete data with clear peaks**: Survey responses on 1-5 scale
- **Large samples with obvious mode**: 10,000 observations with a clear most common value

**Bottom line**: Bootstrap works beautifully for mean and well for median, but for mode, it often reveals that **mode isn't a good statistic for your data**. If bootstrap modes are all over the place, that's telling you something important!