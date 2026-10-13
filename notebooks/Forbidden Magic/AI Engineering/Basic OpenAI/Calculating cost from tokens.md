# Tiktoken
```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")
input_message = {"role": "user", "content": "I'd like to buy a shirt and a jacket. Can you suggest two color pairings for these items?"}

# Use tiktoken to create the encoding for your model
encoding = tiktoken.encoding_for_model("gpt-4o-mini")
# Check for the number of tokens
num_tokens = len(encoding.encode(input_message["content"]))

# Run the chat completions function and print the response
if num_tokens <= 100:
    response = client.chat.completions.create(model="gpt-4o-mini", messages=[input_message])
    print(response.choices[0].message.content)
else:
    print("Message exceeds token limit")
```
# Basic calculation
```python
from openai import OpenAI

client = OpenAI(api_key="your-api-key")

response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": "Say hello"}],
    max_completion_tokens=1000  # This is just the LIMIT
)

# Get ACTUAL usage
input_tokens = response.usage.prompt_tokens      # e.g., 10
output_tokens = response.usage.completion_tokens  # e.g., 5 (not 1000!)
total_tokens = response.usage.total_tokens       # e.g., 15

# Pricing (example for GPT-4)
input_token_price = 0.03 / 1000   # $0.03 per 1K tokens
output_token_price = 0.06 / 1000  # $0.06 per 1K tokens

# Calculate actual cost
cost = (input_tokens * input_token_price + output_tokens * output_token_price)
print(f"Cost: ${cost:.6f}")
```
