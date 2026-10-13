# Use cases
**Data scientist**
- Like a data storyteller; takes a huge amount of data and derives insights
- Descriptive analytics
    - EDA
    - Clustering
- Predictive analytics
    - Uses ML models to generate predictions
    - Classification
    - Regression
**AI engineer**
- Builds AI systems; uses foundation models to build Gen AI systems to transform business processes
- Prescriptive
    - Choosing the best course of action
    - Decision optimization
    - Recommendation engines
- Generative
    - Intelligent assistants / digital advisors
    - Chat bots and conversational search, information retrieval and summarization

# Data
**Data scientist**
- Prefer structured data or tabular data
- Still work with unstructured data but not as much as AI engineers
- 100k or so data points to train model

**AI engineer**
- Primarily work with unstructured data
- 1B to 1T+ data points to train model

# Model
**Data scientist**
- DS toolbox
- A lot of individual specific models
- Narrow in scope
- Hard to generalize past the data that they were trained on
- Smaller in size for parameters
- Less power to train and derive inference
- Less time to train (hours to days)

**AI engineer**
- Gen AI toolbox
- Foundational model
- Generalizes a wide range of tasks without needing to be retrained
- Wide in scope
- Large in size for parameters
- Lost of power to train and derive inference (hundreds to thousands of GPUs)
- Lots of time to train (weeks to months)

# Process
**Data scientist**
Use case --> Data --> Model --> Deploy
- Feature engineering
- Cross validation
- Hyperparameter tuning

**AI engineer**
Use case --> Model --> Prompt engineering --> Embed
- Chaining
- PEFT (Parameter Efficient Fine Tuning)
- RAG (Retrieval Augmented Generation)
- Agents