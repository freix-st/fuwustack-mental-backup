## Colima configuration
Docker expects the default socket location:
`/var/run/docker.sock`

For Colima, the docker daemon is in a Linux VM, with the socket in:
`~/.colima/default/docker.sock`

```sh
export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE="/var/run/docker.sock"
```

- `DOCKER_HOST`: Tells Testcontainers where to find the Docker daemon (inside the VM)
- `TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE`: Tells Testcontainers what socket path to expect inside the container environment (/var/run/docker.sock)

---
## Ryuk and TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE
By default the host path and the internal path match like so:
```sh
docker run -v /var/run/docker.sock:/var/run/docker.sock \
           -p 8080:8080 \
           testcontainers/ryuk
```

But because we changed `DOCKER_HOST`, Ryuk will attempt to use the new value inside which won't work
```
docker run -v unix://$HOME/.colima/default/docker.sock:/var/run/docker.sock \
           -p 8080:8080 \
           testcontainers/ryuk
```

It won't work because Ryuk runs **inside** Colima's VM
![[colima_vm_ryuk_diagram.jpg|383]]
*Ryuk is trying to bind the macOS level socket but it's looking for it inside Colima's VM where it doesn't exist

So we have to override this behavior by explicitly setting `TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE` to the value: `/var/run/docker.sock`, which is where the socket exists inside Colima's VM