# alpine-sshd

Minimal Alpine Linux Docker container with `sshd` exposed and `rsync` installed.

Mount your .ssh credentials at `/root/.ssh/` in order to access the container via root ssh.

## Usage Example

```
docker run --rm -it -p 2222:22 gaff/alpine-sshd
```
