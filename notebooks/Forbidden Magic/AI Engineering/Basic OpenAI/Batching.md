```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

messages = []
# Provide a system message and user messages to send the batch
messages.append({
    "role":"system",
    "content":"Make sure to convert all measurements from kilometers to miles and the final result should be in the form of a table"
})
# Append measurements to the message
[messages.append({"role":"user", "content":str(i)}) for i in measurements]

response = get_response(messages)
print(response)
```