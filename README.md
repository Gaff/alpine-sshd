# alpine-sshd

Minimal Alpine Linux Docker container with `sshd` exposed and `rsync` installed. This uses the excellent [alpine-base][smebbersonalpinebase] with [s6-overlay][s6-overlay]. This means
the image will correctly log, handle errors, and do other things that you'd expect a base image to be capable of.

Mount your .ssh credentials at `/root/.ssh/` in order to access the container via root ssh.
Alternatively pass in your key via the AUTHORIZED_KEY env variable.

## Usage Example

    docker run --rm -it -p 2222:22 -v ~/my_ssh_keys:/root/.ssh/ gaff/alpine-sshd

    docker run --rm -it -p 2222:22 -e AUTHORIZED_KEY="`cat id_rsa.pub`" gaff/alpine-sshd

[s6]: http://www.skarnet.org/software/s6/
[s6-overlay]: https://github.com/just-containers/s6-overlay
[smebbersonalpinebase]: https://hub.docker.com/r/smebberson/alpine-base/
