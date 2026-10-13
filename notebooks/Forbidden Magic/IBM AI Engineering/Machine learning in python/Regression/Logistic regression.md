- Predicts the probability of an observation belonging to one of two classes
- Binary classifier based on statistical logistic regression
- Assign an observation to a class when the probability is greater than / less than the threshold

If data is linearly separable, decision boundary can be a line, plane or hyperplane
$$\huge{\beta_0 + \beta_1 x_1 + \beta_2 x_2 + \cdots + \beta_n x_n \gt 0}$$

It is both a **probability predictor** and a **binary classifier**

The output of logistic regression **is always a probability**. The classification is something done *on top* of the probability output if a discrete class label is needed. It's optional.

Logistic regression uses the cost function [[Log-loss]].

---
# More than 2 classes?

## Binning vs more classes
When we bucket results of a continuous risk score ( excellent / good / fair / poor ), this is **binning** a probability as opposed to multiple classes ( ex. iris species: setosa / versicolor / virginica )

For more classes, you will need **multinomial logistic regression**

There's also **ordinal logistic regression** for when classes have natural order but aren't just bins of one continuous probability (ex. movie ratings 1-5 stars) where the gaps between stages aren't necessarily uniform on a single underlying probability

---
# Training logistic regression
- Choose a set of parameters or $\large{\beta}$
- Predict probability that class = 1
- Calculate prediction error (cost function)
- Update $\large{\beta}$ to reduce prediction error
- Repeat until:
	- Reach small log-loss value
	- Targeted number of iterations

---
# Prediction
- **.predict()** returns the final predicted class label (e.g., 0 or 1).
- **.predict_proba()** returns the raw probabilities for each possible class (e.g., [0.15, 0.85]).

---
# Fixing high log-loss
Feature engineering is the effective solution when the model is underfitting

### When to look at hyperparameter turning first
When your model is **overfitting heavily**, meaning your **training log-loss is low, but your validation/test log-loss is massive.**


‼️TODO: AI notes
## When Your Model is Suffocating from "Overconfidence"

Log-loss severely punishes a model that is confidently wrong. In a model with too little regularization (a lambda close to 0, or a very high $C$), the optimization algorithm will push the feature weights (coefficients) to be extremely large to perfectly separate the training data.

- **The Problem:** Huge coefficients yield extreme, polarized probability predictions (e.g., $0.9999$ or $0.0001$). When that model encounters a validation data point that falls slightly on the wrong side of the decision boundary, that extreme confidence backfires, causing a massive spike in validation log-loss.
    
- **The Lambda Fix:** Increasing lambda ($\lambda$) penalizes large coefficients, forcing them closer to zero. This "softens" the decision boundary, pulling those overconfident $99.9\%$ probabilities back to a safer, more conservative $75\%$. Even if the model still makes a mistake, a mistake at $75\%$ confidence carries a fraction of the log-loss penalty compared to a mistake at $99.9\%$.

## As a Baseline Diagnostic (The "Quick Win" Check)

From a pure workflow efficiency standpoint, tuning lambda is completely automated. You can run a grid search or a `LogisticRegressionCV` in a few lines of code and a few seconds.

- **The Pragmatic Approach:** If you inherit a model with terrible log-loss, checking if lambda is drastically misconfigured is a 10-second task. If tweaking lambda instantly drops the validation loss, you've solved your variance problem. If it doesn't, you have definitive proof that the model is underfitting, giving you a green light to spend hours on deep feature engineering.

|**Training Log-Loss**|**Validation Log-Loss**|**The Diagnosis**|**Your First Move**|
|---|---|---|---|
|**High**|**High**|Underfitting (Model is too simple)|**Feature Engineering**|
|**Low**|**High**|Overfitting (Model is overconfident)|**Tune Lambda ($\lambda$)**|