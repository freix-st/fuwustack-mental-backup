‼️ This issue is specific to Windows with WSL

Assume that there is a workflow waiting for tags to be pushed for it to run:
```yaml
on:
  push:
    tags:
      - 'v*.*.*'
```

When there is a script for pushing tags (`.sh`), running it with WSL in NAT networking mode can cause the script to fail. AI can try to resolve this issue by reading the script, inferring the behavior and attempting to run it in its own way by possibly running `git push`.

Even if GitBash (mingw bash) is installed, using the `bash` command in cmd or PowerShell in Windows 11 will instead activate WSL and call bash from there. This behavior supersedes having the GitBash directory as part of your PATH variable.
## Setting up WSL to mirrored networking mode
Update WSL and add config:
```bat
wsl --update
notepad $env:USERPROFILE\.wslconfig
```

In `.wslconfig`:
```ini
[wsl2]
networkingMode=mirrored
dnsTunneling=true
autoProxy=true
```

Then restart WSL and verify the mode:
```bat
wsl --shutdown
wsl wslinfo --networking-mode
```

Output: `mirrored`

## Issues with the tagging script
[[Git pushing tags]]