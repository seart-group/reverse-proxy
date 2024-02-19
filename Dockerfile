FROM node:lts-alpine AS build

COPY index.js          \
     pages.json        \
     template.hbs      \
     package.json      \
     package-lock.json \
     ./

RUN npm ci --quiet --omit=dev && node .

FROM nginx:1.25.4
LABEL maintainer="Ozren Dabić (dabico@usi.ch)"

ENV TZ=UTC

RUN rm -rf /usr/share/nginx/html/*.html

COPY --from=build /html /usr/share/nginx/html

COPY default.conf /etc/nginx/conf.d/default.conf
COPY errors.conf /etc/nginx/conf.d/template/errors.conf

VOLUME /etc/nginx/conf.d/include
VOLUME /etc/nginx/conf.d/template

HEALTHCHECK \
    --start-period=10s \
    --interval=60s \
    --timeout=30s \
    --retries=5 \
    CMD service nginx status || exit 1
