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
	&& git checkout 4ed9908b2c0f8ada1ad2b5154df43f1570c39104 \
	&& go mod download \
 	&& make

##
## Stage 2 (build_site)
##
FROM node:12 AS build_site

COPY . /app

WORKDIR /app
RUN npm install \
	&& npm run build


##
## Stage 3 (runtime)
##
FROM nginx:1.17-alpine

RUN rm -fr /usr/share/nginx/html
RUN apk update \
	&& apk add dcron \
	&& rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/cron \
	&& mkdir -m 0644 -p /var/spool/cron/crontabs \
	&& touch /var/log/cron/cron.log \
	&& mkdir -m 0644 -p /etc/cron.d

COPY --from=build_collector /app/fi-cli /usr/bin/fi-cli
COPY --from=build_site /app/dist/ /usr/share/nginx/html
COPY docker/crontab /etc/crontab2
COPY docker/entrypoint.sh /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]

