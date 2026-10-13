# Documentation
## Technical document
- Problem statement
- Architecture
- Pricing
- Scaling
- Resilience
- Alternative architectures

## Timeline
Well defined blocking for phases
- MVP phase
- Consider adding estimated story points

## Gantt chart
Tracks team progress on what phase should the project be in at any given time

# Coworking systems
## Jira/Kanban board
**Setup columns**
- TODO
- PROCESSING
	- Development
	- Staging
- OH HOLD
	- Waiting for information
	- Waiting for verification
	- Review
- DONE

**Epics and tasks**
Create epics based on timeline. Task to generate these can be divided across members.

**Epics**
- Divide as IaC and services (ex. IaC, web service, aggregation service, etc.)
**Tasks**
- Under every service define specific steps
- Should have **acceptance criteria**

*If using AI, feed it the technical document and timeline

> ‼️ Make sure that the epics are documented as wiki pages or documents first!
> **Do not publish to Jira directly.**

After making pages/docs, look for and resolve overlaps/conflicts.
After resolution, ok to publish epics and tasks

**Teams channel**
- Setup tags (ex. can simplify using tag instead of names when asking for PR review)

**GitHub repo**
- CODEOWNERS
- Branch protection
- Contributing.md
- Readme.md
- Conventions [[Decision documentation (Sprint 0)]]

**Service account**
- Setup credentials
- Credential manager for storing username and password