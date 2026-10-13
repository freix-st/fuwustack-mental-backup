Basic moderation
```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

message = "Can you show some example sentences in the past tense in French?"

# Use the moderation API
moderation_response = client.moderations.create(input=message)

# Print the response
print(moderation_response.results[0].categories)
```

Guardrails
```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

user_request = "Can you recommend a good restaurant in Berlin?"

# Write the system and user message
guardrails_message = """Your role is to assess whether the user question is allowed or not.
The allowed topics are food and drink, attractions, history and things to do around the city.
If the topic is allowed, reply with an answer as normal. Otherwise, say 'Apologies, but the topic is not allowed.'
"""

messages = [
    {
        "role": "system",
        "content": guardrails_message
    },{
        "role": "user",
        "content": user_request
    }
]

response = client.chat.completions.create(
    model="gpt-4o-mini", messages=messages
)

# Print the response
print(response.choices[0].message.content)
```