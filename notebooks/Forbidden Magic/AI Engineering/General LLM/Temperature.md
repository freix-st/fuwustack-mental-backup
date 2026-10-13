# Practical Guidelines

| Temperature | Use Case               | Example                                    |
| ----------- | ---------------------- | ------------------------------------------ |
| 0.0 - 0.3   | Factual, deterministic | Math, code, translations, data extraction  |
| 0.5 - 0.7   | Balanced, consistent   | Customer support, documentation, summaries |
| 0.7 - 1.0   | Creative but coherent  | Marketing copy, emails, general chat       |
| 1.0 - 1.5   | Very creative          | Brainstorming, fiction, poetry             |
| 1.5 - 2.0   | Maximum creativity     | Experimental, avant-garde content          |
## Temperature = 0 Special Case

When `temperature=0`, the model becomes **fully deterministic**:

- Same input → same output (every time)
- Useful for testing, reproducibility, and when you need consistency