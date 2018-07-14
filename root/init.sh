#!/bin/sh
if [ ! -f /conf/aria2.conf ]; then
	cp /conf-temp/aria2.conf /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi
if [ ! -f /conf/on-complete.sh ]; then
	cp /conf-temp/on-complete.sh /conf/on-complete.sh
fi

chmod +x /conf/on-complete.sh
touch /conf/aria2.session

darkhttpd /aria-ng --port 80 &
darkhttpd /downloads --port 8080 &
aria2c --conf-path=/conf/aria2.conf
