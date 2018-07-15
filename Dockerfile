FROM alpine:latest

MAINTAINER colinwjd <wjdwjd@live.cn>

RUN apk update \
	&& apk add --no-cache --update aria2 darkhttpd \
	&& mkdir -p aria2/conf aria2/conf-temp aria2/downloads aria-ng \
	&& wget --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/0.4.0/aria-ng-0.4.0.zip \
	&& unzip aria-ng-0.4.0.zip -d aria-ng \
	&& rm -rf aria-ng-0.4.0.zip

COPY init.sh /aria2/init.sh
COPY conf-temp /aria2/conf-temp

WORKDIR /
VOLUME ["/aria2/conf", "/aria2/downloads"]
EXPOSE 6800 80 8080

CMD ["/aria2/init.sh"]
