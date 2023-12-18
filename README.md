# SEART reverse-proxy

To coordinate traffic to our web services, we make use of an NGINX web-server, acting as a reverse-proxy.
The reverse-proxy efficiently handles incoming HTTP requests, forwarding them to the appropriate backend services based on predefined rules.
Configuration and management of the reverse-proxy is handled via `docker-compose`.
