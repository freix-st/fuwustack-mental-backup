```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "<URL>",
    "ANTHROPIC_AUTH_TOKEN": "<TOKEN>",
    "CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS": "1",
    "CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY": "1",
    "DISABLE_NON_ESSENTIAL_MODEL_CALLS": "1",
    "DISABLE_TELEMETRY": "1",
    "DISABLE_COST_WARNINGS": "1"
  },
  "permissions": {
	  "allow": [
		  "WebSearch"
	  ]
  },
  "model": "sonnet",
  "enabledPlugins": {
    "playwright@claude-plugins-official": true,
    "superpowers@claude-plugins-official": true
  },
  "extraKnownMarketplaces": {
    "claude-plugins-official": {
      "source": {
        "source": "git",
        "url": "https://github.com/anthropics/claude-plugins-official.git"
      }
    }
  },
  "effortLevel": "high",
  "autoUpdatesChannel": "latest",
  "theme": "dark"
}
```