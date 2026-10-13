Basic error handling
```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

# Use the try statement
try:
    response = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[message]
    )
    # Print the response
    print(response.choices[0].message.content)
# Use the except statement
except openai.AuthenticationError as e:
    print("Please double check your authentication key and try again, the one provided is not valid.")
```

**Connection errors**
```python
InternalServerError
APIConnectionError
APITimeoutError
```

**Resource limit errors**
```python
ConflictError
RateLimitError
```

**Authentication errors**
```python
AuthenticationError
```

**Bad request errors**
```python
BadRequestError
```