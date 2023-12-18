# SEART reverse-proxy

To coordinate traffic to our web services, we make use of an NGINX web-server, acting as a reverse-proxy.
The reverse-proxy efficiently handles incoming HTTP requests, forwarding them to the appropriate backend services based on predefined rules.
Configuration and management of the reverse-proxy is handled via `docker-compose`.

Before deploying the project for the first time, make sure that a dedicated `docker` network exists:

```bash
docker network create reverse-proxy-network
```

---   

### References

1. [Using Docker to Set up Nginx Reverse Proxy With Auto SSL Generation](https://linuxhandbook.com/nginx-reverse-proxy-docker)
2. [Let nginx start if upstream host is unavailable or down](https://sandro-keil.de/blog/let-nginx-start-if-upstream-host-is-unavailable-or-down)
3. [Setup nginx not to crash if host in upstream is not found](https://stackoverflow.com/a/32846603/17173324)
4. [TLS handshake failed when using TLS1.3](https://github.com/spring-cloud/spring-cloud-gateway/issues/2332)
