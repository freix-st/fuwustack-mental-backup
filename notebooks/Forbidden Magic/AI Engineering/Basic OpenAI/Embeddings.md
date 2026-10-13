```python
# Create an OpenAI client
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

# Create a request to obtain embeddings
response = client.embeddings.create(
    model = "text-embedding-3-small",
    input = "A futures contract is a binding agreement to buy or sell an asset (like oil, gold, or stock indices) at a set price on a specific future date. Unlike stocks, you don't own the asset—you're obligated to complete the transaction when the contract expires. The key feature is leverage: you only put up a small deposit (margin), often 5-10% of the contract value, which means small price moves create large gains or losses. Futures are used by businesses to hedge risk (e.g., airlines locking in fuel costs) and by traders to speculate on price movements. Because of the high leverage and daily settlement of gains/losses, futures are powerful but risky financial instruments."
)

# Convert the response into a dictionary
response_dict = response.model_dump()
print(response_dict)
```

Printing
```python
response_dict['usage']['total_tokens']
response_dict['data'][0]['embedding']
```

Embedding multiple inputs
```python
# Extract a list of product short descriptions from products
product_descriptions = [product['short_description'] for product in products]

# Create embeddings for each product description
response = client.embeddings.create(
    model = 'text-embedding-3-small',
    input = product_descriptions
)
response_dict = response.model_dump()

# Extract the embeddings from response_dict and store in products
for i, product in enumerate(products):
    product['embedding'] = response_dict['data'][0]['embedding']
    
print(products[0].items())
```