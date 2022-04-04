# ubuntu22.04-sshd
IntelliJのRemote Developmentを試すためにsshdを起動するためのDockerImage

起動用コマンド（PowerShell）

```PowerShell
docker run --rm -d -v home:/remote -v $HOME/.ssh:/host_keys -p 22:22/tcp ubuntu22.04-sshd:latest
```
