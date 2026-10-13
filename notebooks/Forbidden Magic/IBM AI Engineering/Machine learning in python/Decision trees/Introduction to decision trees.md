- Each internal node corresponds to a test
- Each branch corresponds to the result of that test
- Each terminal, or leaf node, assigns its data to a class

- Start with a seed node and labeled training data
- Find the feature that best splits the data
	- Common split measures:
		- Information gain (entropy reduction)
		- Gini impurity
- Each split partitions the node's input data
- Repeat the process for each new node

### Pre-emptive pruning
When a stopping criteria is met
- Maximum tree depth is reached
- Minimum number of data points in a node has been exceeded
- Minimum number of samples in a leaf has been exceeded
- Decision tree has reached the maximum number of leaf nodes

### Why prune?
- Pruning simplifies a tree
- Pruned tree is more concise and easier to understand
- Pruning results in better predictive accuracy

### Entropy reduction
- Measure entropy
- If classes are completely homogeneous, entropy, 0
- If classes are equally divided, 1

**Information gain** = entropy of a tree before split - weighted entropy after split
- Increase in information gain is decrease in entropy

## Advantages of decision trees
- Model visualization
- Interpretability
- Analysis and prediction