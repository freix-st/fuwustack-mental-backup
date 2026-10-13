# Using specs already written by hand
Point Claude to the file then use superpowers on it
```
Read <file dir>. Use superpowers:writing-plans to turn it to an implementation plan, then implement it.
```

# Full superpowers use playbook
## With manual inspection
### Idea --> Spec
Using inline idea
```
Use superpowers:brainstorming. I want to build: My idea

- Constraints: <language/framework, anything non-negotiable>
- Out of scope: <what you don't want>
```

Using idea file
```
Use superpowers:brainstorming on the idea in "./docs/idea.md"
```

**Modifiers:**
Note: normal behavior is to immediately call `superpowers:writing-plans`

Don't commit
```
Stop after the spec is written.
Don't commit or push
Don't start the plan yet
```

Don't start plan
``` 
Stop after the spec is written and committed - don't start the plan yet.
```
### Spec --> Plan
```
Use superpowers:writing-plans on
./docs/superpowers/specs/2026-08-10-<topic>.md
```
Generates `./docs/superpowers/specs/2026-08-10-<feature>.md`

### Plan --> Code
```
Use superpowers:subagent-driven-development to execute
./docs/superpowers/specs/2026-08-10-<feature>.md
```