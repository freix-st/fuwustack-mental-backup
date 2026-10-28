## Don't push many tags at once
Officially, three or less is ok but it's also more extensible to go one by one.
❌ `git push origin v0.0.1_foo v0.0.1_bar v0.0.1_baz v0.0.1_qux`
✅ `git push origin v0.0.1_foo v0.0.1_bar v0.0.1_baz`

For this reason it's also not recommended to use `git push --tags`

One by one pushing:
```sh
git push origin v0.0.1_foo
git push origin v0.0.1_bar
git push origin v0.0.1_baz
git push origin v0.0.1_qux
```

By loop:
```sh
tags=(
  v0.0.1_web
  v0.0.1_api
  v0.0.1_foo
  v0.0.1_bar
)

for tag in "${tags[@]}"; do
  git push origin "$tag"
done
```

By loop with pattern matching for shared prefix:
```sh
for tag in $(git tag -l "v0.0.1_*"); do
  git push origin "$tag"
done
```