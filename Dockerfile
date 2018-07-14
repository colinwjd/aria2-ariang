FROM alpine:latest

MAINTAINER colinwjd <wjdwjd@live.cn>

WORKDIR /
RUN apk update \
	&& apk add --no-cache --update aria2 darkhttpd \
	&& mkdir -p conf conf-temp downloads aria-ng \
	&& wget --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/0.4.0/aria-ng-0.4.0.zip \
	&& unzip aria-ng-0.4.0.zip -d aria-ng \
	&& rm -rf aria-ng-0.4.0.zip

COPY root/init.sh /conf-temp/init.sh
COPY root/aria2.conf /conf-temp/aria2.conf
COPY root/on-complete.sh /conf-temp/on-complete.sh

VOLUME ["/conf", "/downloads"]
EXPOSE 6800 80 8080

CMD ["/conf-temp/init.sh"]
