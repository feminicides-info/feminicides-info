##
## Stage 1 (build_collector)
##
FROM golang:1.12-alpine AS build_collector

ENV GOBIN=/app/bin

RUN apk update \
	&& apk add git make \
	&& rm -rf /var/cache/apk/*

RUN git clone https://github.com/glenux/feminicides-info-cli/ /app \
	&& cd /app \
	&& git checkout df198d31b4c572bc8b7329180b14094208e1b4b7 \
	&& go mod download \
 	&& make

##
## Stage 2 (build_site)
##
FROM node:12 AS build_site

COPY package.json /app/package.json

WORKDIR /app
RUN npm install

COPY . /app
RUN npm run build


##
## Stage 3 (runtime)
##
FROM nginx:1.17-alpine

RUN rm -fr /usr/share/nginx/html
RUN apk update \
	&& apk add dcron ca-certificates \
	&& rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/cron \
	&& mkdir -m 0644 -p /var/spool/cron/crontabs \
	&& touch /var/log/cron/cron.log \
	&& mkdir -m 0644 -p /etc/cron.d

COPY --from=build_collector /app/fi-cli /usr/bin/fi-cli
COPY --from=build_site /app/dist/ /usr/share/nginx/html
COPY docker/feminicides-update /usr/bin/feminicides-update
COPY docker/entrypoint.sh /app/entrypoint.sh
COPY docker/crontab /etc/cron.d/feminicides-update

CMD ["/app/entrypoint.sh"]

