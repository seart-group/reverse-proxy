FROM node:lts-alpine AS build

WORKDIR /

COPY html html/
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

COPY --from=build /html /usr/share/nginx/html

COPY default.conf /etc/nginx/conf.d/default.conf

VOLUME /etc/nginx/conf.d/include
