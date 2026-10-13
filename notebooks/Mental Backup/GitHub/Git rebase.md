```sh
git fetch origin
git rebase origin/dev

# resolve any problems if they come up
git push --force-with-lease
```
# Why --force-with-lease?
When pushing, git performs a "fast forward check"
1. Get remote tip (R)
2. Get local tip (L)
3. Is R a parent commit of L?

If yes, then it's easy to figure out how to connect L's added commits to R

**Normal tree**
```
Remote: A (Remote tip)

Local:  A --> B --> C (Local tip) 
```
- It's straightforward how to push the changes

```
Remote:
-----------------------------------------------
0fab3d | A  | feat: case transition                    <-- REMOTE TIP

Local:
-----------------------------------------------
0fab3d | A  | feat: case transition
6e4a21 | B  | fix: replaced SQS url in PROD
97cde0 | C  | feat: added eventbridge cron trigger     <-- LOCAL TIP
```

**Rebase tree**
The committer dates change, which in turn change the commit hash.
Code same but metadata different (mark B as B', C as C')

```
Remote: A  -->  B  -->  C (Remote tip)

Local:  A  -->  X  -->  B' -->  C' (Local tip)
```
- C isn't an ancestor of C'
	- Where are we supposed to connect B' ?
	- What happens to B and C?

```
Remote:
-----------------------------------------------
0fab3d | A  | feat: case transition
6e4a21 | B  | fix: replaced SQS url in PROD
97cde0 | C  | feat: added eventbridge cron trigger      <-- REMOTE TIP

Local:
-----------------------------------------------
0fab3d | A  | feat: case transition
78b2a6 | X  | chore: documentation worker module    Commit from this branch 
2c156f | B' | fix: replaced SQS url in PROD         Rebase start
65d40a | C' | feat: added eventbridge cron trigger      <-- LOCAL TIP
```
## Rebase process
There are 2 trackers in the local `.git`

Before rebase
```
.git/refs/heads/feature          --> 97cde0 (C)
.git/refs/remotes/origin/feature --> 97cde0 (C)
```

After rebase
```
.git/refs/heads/feature          --> 65d40a (C')
.git/refs/remotes/origin/feature --> 97cde0 (C)
```

## Force with lease
 `--force-with-lease` will enforce a check to make sure the new weird tree is because of a rebase.

Steps:
- Get remote tip from server (`97cde0 (C)`)
- Does `.git/refs/remotes/origin/feature` match it?

From before:
```
.git/refs/heads/feature          --> 65d40a (C')
.git/refs/remotes/origin/feature --> 97cde0 (C)

Remote tip from server           --> 97cde0 (C)
```

✅ If **yes**, force the push from local copy

Before push
```
Remote: A  -->  B  -->  C
Local:  A  -->  X  -->  B' -->  C'
```

After push
```
Remote: A  -->  X  -->  B' -->  C'
Local:  A  -->  X  -->  B' -->  C'

Dangling: B, C
```
- B and C will be cleaned up eventually

```diff
Remote:
-----------------------------------------------
0fab3d | A  | feat: case transition      <-- LAST MATCHING ANCESTOR
- 6e4a21 | B  | fix: replaced SQS url in PROD
- 97cde0 | C  | feat: added eventbridge cron trigger

Local:
-----------------------------------------------
0fab3d | A  | feat: case transition     <-- LAST MATCHING ANCESTOR
+ 78b2a6 | X  | chore: documentation worker module
+ 2c156f | B' | fix: replaced SQS url in PROD
+ 65d40a | C' | feat: added eventbridge cron trigger
```

❌ If **no**, reject the push