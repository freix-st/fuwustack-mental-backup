- Mac location: `~/.config/opencode/`
- Available variants depend on the model. For example:
	- Deepseek v4 Flash - low, high, max
	- GPT 5.6 Luna - low, medium, high, xhigh, max

```json
{
	"$schema": "https://opencode.ai/config.json",
	"plugins": [
		"superpowers@git+https://github.com/obra/superpowers.git"
	],
	"providers": {
		"my-custom-provider": {
			"name": "My Custom",
			"package": "@opencode/ai/providers/openai-compatible",
			"settings": {
				"baseURL": "<custom base URL>",
				"apiKey": "<kimi no token>",
				"includeUsage": true
			},
			"body": {
				"disable_fallbacks": true
			},
			"models": {
				"deepseek-v4-flash-0731": {
					"name": "deepseek-v4-flash-0731",
					"modelID": "deepseek-v4-flash-0731",
					"settings": {
						"reasoningEffort": "high"
					},
					"variants": [
						{
							"id": "low",
							"settings": {
								"reasoningEffort": "low"
							}
						},{
							"id": "high",
							"settings": {
								"reasoningEffort": "high"
							}
						},{
							"id": "max",
							"settings": {
								"reasoningEffort": "max"
							}
						}
					]
				}
			}
		}
	}
}
```