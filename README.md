# Expose Docker socket via TCP
Sometimes it's complicated to run TLS-supported Docker Remote API queries. To facilitate this without having to change the Docker daemon's settings, use this image to expose the Docker socket via TCP.

Also, there seem to be some bugs in the current Docker version.

See

* https://github.com/docker/docker/issues/16118

## Running
The image's internal port of the Docker socket is `12375`. You can remap the port via `-p 1234:12375` for example. This would expose the Docker socket on port `1234` on the Docker host.

Run `docker run -d -v /var/run/docker.sock:/var/run/docker.sock -p 1234:12375 --name expose -t tobilg/expose-socket` on the Docker/Boot2Docker host.

**Attention: This is exposing your Docker socket (meaning full access!) to the public! Don't do this on public networks etc. This image is just intended for quick testing of the Docker Remote API!***