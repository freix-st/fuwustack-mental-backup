If the file actions is trying to run doesn't have execute permission, it will fail when trying to execute it. To fix this, update the index:
```sh
git update-index --chmod=+x ./gradlew
```