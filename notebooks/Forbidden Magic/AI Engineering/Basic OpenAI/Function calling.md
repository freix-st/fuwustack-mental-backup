# Defining and running
```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

response= client.chat.completions.create(
    model="gpt-4o-mini",
    # Add the message
    messages=message_listing,
    # Add your function definition
    tools=function_definition
)

# Print the response
print(response.choices[0].message.tool_calls[0].function.arguments)
```

‼️TODO: AI + mess
```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

# Define the function parameter type
function_definition[0]['function']['parameters']['type'] = 'object'

# Define the function properties
function_definition[0]['function']['parameters']['properties'] = {
    'title': {
        'type': 'string',
        'description': 'Title of the research paper'
    },
    'year': {
        'type': 'string',
        'description': 'The year the paper was published'
    } 
}

response = get_response(messages, function_definition)
print(response)
```

```python
function_definition = [{
	'type': 'function',
	'function': {
		'name': 'extract_job_info',
		'description': 'Get the job information from the body of the input text','parameters': {
			'type': 'object',
			'properties': {
				'job': {
					'type': 'string',
					'description': 'Job title'
				},
				'location': {
					'type': 'string',
					'description': 'Location'
				}
			}
		}
	}
}]

client = OpenAI(api_key="<OPENAI_API_TOKEN>")

response= client.chat.completions.create(
    model=model,
    messages=messages,
    # Add the function definition
    tools=function_definition,
    # Specify the function to be called for the response
    tool_choice={
        'type': 'function',
        'function': {
            'name': 'extract_job_info'
        }
    }
)

# Print the response
print(response.choices[0].message.tool_calls[0].function.arguments)
```

FULL CODE:
```python
# 1. Define the schema (what you have)
function_definition = [{
    'type': 'function',
    'function': {
        'name': 'extract_job_info',
        'description': 'Get the job information from the body of the input text',
        'parameters': {
            'type': 'object',
            'properties': {
                'job': {'type': 'string', 'description': 'Job title'},
                'location': {'type': 'string', 'description': 'Location'}
            }
        }
    }
}]

# 2. Write the ACTUAL Python function
def extract_job_info(job, location):
    """Actually do something with the extracted data"""
    return {
        'job': job,
        'location': location,
        'formatted': f"Job: {job} in {location}"
    }

# 3. Call OpenAI API
response = client.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": "I'm looking for a Software Engineer position in San Francisco"}],
    tools=function_definition,
    tool_choice={'type': 'function', 'function': {'name': 'extract_job_info'}}
)

# 4. Parse the LLM's response
tool_call = response.choices[0].message.tool_calls[0]
function_args = json.loads(tool_call.function.arguments)
# function_args might be: {"job": "Software Engineer", "location": "San Francisco"}

# 5. Actually CALL your Python function with the LLM's extracted arguments
result = extract_job_info(**function_args)

print(result)
# Output: {'job': 'Software Engineer', 'location': 'San Francisco', 
#          'formatted': 'Job: Software Engineer in San Francisco'}
```

Calling API
```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

# Define the function to pass to tools
function_definition = [{"type": "function",
                        "function" : {"name": "get_airport_info",
                                "description": "This function calls the Aviation API that can give info about airport matching an airport code",
                                "parameters": {"type": "object", "properties": {"airport_code": {"type": "string", "description": "The airport code that is the keyword argument to be passed to the function"}} }, 
                                "result": {"type":"string"} }}]

response = get_response(function_definition)
print(response)
```

Calling API 2
```python
client = OpenAI(api_key="<OPENAI_API_TOKEN>")

# Call the Chat Completions endpoint 
response = client.chat.completions.create(
  model="gpt-4o-mini",
  messages=[
    {"role": "system", "content": "You are an AI assistant, a specialist in aviation. You should interpret the user input, and based on it extract one airport code mentioned."},
    {"role": "user", "content": "I'm planning to land a plane in JFK airport in New York and would like to have the corresponding information."}],
  tools=function_definition)

print_response(response)
```

```python
# Check that the response has been produced using function calling
if response.choices[0].finish_reason == "tool_calls":
# Extract the function
    function_call = response.choices[0].message.tool_calls[0].function.name
    print(function_call)
else:
    print("I am sorry, but I could not understand your request.")
```

```python
if response.choices[0].finish_reason=='tool_calls':
  function_call = response.choices[0].message.tool_calls[0].function
  # Check function name
  if function_call.name == 'get_airport_info':
    # Extract airport code
    code = json.loads(function_call.arguments)["airport code"]
    airport_info = get_airport_info(code)
    print(airport_info)
  else:
    print("Apologies, I couldn't find any airport.")
else: 
  print("I am sorry, but I could not understand your request.")
```
# Parsing output of multiple tools

```python
for tool_call in response.choices[0].message.tool_calls:
    function_name = tool_call.function.name  # Check THIS
    function_args = json.loads(tool_call.function.arguments)
    tool_call_id = tool_call.id  # Save this for later
    
    # Route to your actual function based on name
    if function_name == "get_weather":
        result = get_weather(**function_args)
    elif function_name == "search_database":
        result = search_database(**function_args)
    elif function_name == "send_email":
        result = send_email(**function_args)
    else:
        result = f"Unknown function: {function_name}"
    
    # Send result back with the ID
    tool_messages.append({
        "role": "tool",
        "tool_call_id": tool_call_id,  # Reference the original call
        "content": result
    })
```