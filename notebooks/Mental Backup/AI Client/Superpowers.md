GitHub location: https://github.com/obra/superpowers

Opencode v2 plugin
```json
"plugins": [
	"superpowers@git+https://github.com/obra/superpowers.git"
]
```

For Claude code, use marketplace
## Modifiers
Can add constraints
- Language/framework, anything non-negotiable
- Define what's out of scope

Can force a stop after spec to review
```
Stop after the spec is written.
Don't commit or push
Don't start the plan yet
```

Can exclude **push** especially if multiple batches of issues are being addressed to not trigger CICD with on push condition
```
The current branch is <branch>.
This branch was created to isolate any changes.

- Changes are ok to commit but don't push yet
- Make sure commit messages follow conventional commits like other commits to the repo
```