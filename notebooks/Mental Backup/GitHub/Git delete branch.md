## Local branch
Safe delete (fails if has unmerged changes)
```sh
git branch -d <branch>
```

Force delete
```sh
git branch -D <branch>
```

## Remote branch
```sh
git push origin --delete <branch>
```

If it was deleted through UI, clean up local tracking copy
```sh
git fetch --prune
```