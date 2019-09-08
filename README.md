# Instantaneous Squid
> Add water, stir, and that's it!

Instantaneous Squid is a boringly simple Squid proxy server, without cache nor special functionalities meant to run as a proxy for incoming connections on 127.0.0.1.

## Motivation

Let's assume you've got a host in a different ISP (e.g. different country) and you want to SSH-tunnel into your private proxy in order to access it. This container provides a small and clean proxy for that purpose.

## Requireents

In order to get instasquid working and being able to connect, you need three things:

- Docker 1.10.0+
- SSH server with `AllowTcpForwarding` enabled
- An `ssh` client
## Usage

In the host where the proxy should be sitting, run the following commands:

```
git clone https://github.com/PeGa/instasquid
docker-compose up -d --build
```

To verify that the container is running, you should see something like this after running `docker ps`:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
bf7c008cb2e0        instasquid:latest   "/bin/sh -c 'sleep 1…"   53 seconds ago      Up 52 seconds       127.0.0.1:3128->3128/tcp   instasquid_main_1
```

Once the container is running, ssh to your host with the following command:

```
ssh youruser@you_host_where_instasquid_is_running -NL 3128:127.0.0.1:3128
```

After entering your password, you should be left with a blank cursor and no other response. The tunnel should be running.

Go to your favorite browser, and set up your proxy to 127.0.0.1:3128 and set it to work with all protocols.

After confirming your new proxy settings, your private proxy tunnel is working!

## Removal

`docker-compose down --rmi all --remove-orphans`
