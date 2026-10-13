1. Naive Bayes
2. Support vector machines
3. Neural networks

**Multi-class classifiers**
1. Logistic regression
2. Decision trees
3. K-nearest neighbors

# Extending binary classifiers into multi-class
## One-versus-all strategy
- K-classes = K binary classifiers
- One binary classifier per class
- Every data point passes through all the models that will attempt to say it belongs to the class that a model represents

Example for colors:
- Model 1: Is it GREEN or not?
- Model 2: Is it BLUE or not?
- Model 3: Is it RED or not?
- Model 4: Is it ORANGE or not?
## One-versus-one strategy
- "Is it this or is it that?"
- Consider all pairs of classes

Example for colors:
- Model 1: Is it RED or is it BLUE
- Model 2: Is it RED or is it GREEN?
- Model 3: Is it RED or is it ORANGE?

- Model 4: Is it BLUE or is it GREEN?
- Model 5: Is it BLUE or is it ORANGE?

- Model 6: Is it GREEN or is it ORANGE?

**Voting scheme**
The final prediction can be through a popularity-based voting scheme.

Example for colors:
- Model 1 prediction: RED
- Model 2 prediction: GREEN
- Model 3 prediction: RED

- Model 4 prediction: GREEN
- Model 5 prediction: ORANGE

- Model 6 prediction: GREEN

- Final prediction: GREEN (with 3 points)

**Tie-breaking**
In the case that there is a tie, consider adding weight to the votes.
Possible weight can be model confidence on their predictions or probability.
Finally, it can be a case where one-versus-all is more appropriate

## All-versus-one strategy