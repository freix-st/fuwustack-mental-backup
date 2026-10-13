# Pipelines
Pipelines are a convenient way for quickly performing local inference for any models and tasks available on Hugging Face
### Text generation
```python
from transformers import pipeline 

gpt_pipeline = pipeline(task="text-generation", model="openai-community/gpt2")

# Generate 2 text outputs with a maximum length of 10 tokens
results = gpt_pipeline("What if AI", max_new_tokens=10, num_return_sequences=2)

for result in results:
    print(result['generated_text'])
```

### Text classification
Use a specialized model (ex. distilbert)
- **Sentiment analysis** - distilbert
- **Grammar correction** - abdulmatinomotoso/English_Grammar_Checker
- **Question Natural Language Inference (QNLI)** - cross-encoder/qnli-electra-base
```python
from transformers import pipeline

classifier = pipeline(
	task="text-classification",
	model="distilbert-base-uncased-finetuned-sst-2-english"
)

print(my_pipeline("Wifi is slower than snail today!"))

# [{'label':'NEGATIVE;, 'score': 0.99}] 
```

QNLI format example
```python
classifier("Where is Seattle located?, Seattle is located in Washington State.")
# [{'label': 'LABEL_0', 'score': 0.997}]
```

### Dynamic category assignment
Assigns pre-defined categories to text based on content.
Useful for content moderation and recommendation systems.

```python
classifier = pipeline(
	task="zero-shot-classification",
	model="facebook/bart-large-mnli"
)

text = "Hey, we would like to feature your research on our newsletter!"
categories = ["marketing", "sales", "support"]

output = classifier(text, categories)

print(f"Top label: {output['labels'][0]} with score: {output['scores'][0]}")
# Top label: support with score: 0.8183
```

### Summarization
Defined in [[Summarization]]
- **Extractive summarization** - nyamuda/extractive-summarization
- **Abstractive summarization** - sshleifer/distibart-cnn-12-6

```python
classifier = pipeline(
	task="summarization",
	model="nyamuda/extractive-summarization",
	min_new_tokens=10,
	max_new_tokens=150
)

text = "This is my really large text about Data Science..."
summary_text = summarizer(text)

print(summary_text[0]['summary_text'])
# Data science is a field that combines mathematics, statistics..."
```
- `min_new_tokens` and `max_new_tokens` control the summary length

# Inference providers
These are partner organizations to Hugging Face that will send a request to a provider's machines and then send the inference back to the client.

```python
from huggingface_hub import InferenceClient

client = InferenceClient(
	provider = "together",
	api_key = os.environ["HF_TOKEN"],
)

completion = client.chat.completions.create(
	model = "deepseek-ai/DeepSeek-V3",
	messages = [
		{
			"role": "user",
			"content": "What is the capital of Belgium?"
		}
	],
)

print(completion.choices[0].message)
```