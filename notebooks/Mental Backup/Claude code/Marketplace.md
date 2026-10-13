**SSH format**
`owner/repo`
This will require GitHub SSH keys

**HTTPS format**
`https://github.com/anthropics/claude-plugins-official`
Won't need SSH keys

**Using custom corporate CA for HTTPS**
If company uses its own corporate CA, this will intercept TLS
Make git use Windows certificate store (if CA is there)
```sh
git config --global http.sslBackend schannel
```

To revert
```sh
git config --global --unset http.sslBackend
```