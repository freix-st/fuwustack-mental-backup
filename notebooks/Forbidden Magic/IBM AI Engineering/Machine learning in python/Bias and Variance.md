- Bias - it's going in a certain direction, related to accuracy
- Variance - scatter, related to precision

**Weak learners**
- Underfitting
- High bias
- Low variance

**Strong learners**
- Overfitting
- Low bias
- High variance

# Mitigating bias and variance
## Bagging
Bagging = Bootstrap aggregating
- Train on bootstrapped data
- Do it multiple times then average the predictions

Example algorithms: Random forest
## Boosting
- Form an **ensemble** of models
- Weights of wrong data are increased
- Weights of right data are decreased

Only the weight or **penalty** is increased. This just means that making a mistake with the same data again will penalize the next model more heavily

Example algorithms: Gradient boost, AdaBoost, XGBoost