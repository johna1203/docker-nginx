FROM johna1203/docker-debian:latest
MAINTAINER Johnathan Froeming <johnathan@kodokux.com>
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 && \
	echo "deb http://www.nginx.org/packages/debian/ jessie nginx" > /etc/apt/sources.list.d/nginx.list && \
	apt-get update && \
	apt-get install -y nginx && \
	apt-get clean && \
	echo -n > /var/lib/apt/extended_states
RUN rm -rf /etc/nginx/*.d && \
 mkdir -p /etc/nginx/addon.d /etc/nginx/conf.d /etc/nginx/host.d /etc/nginx/nginx.d
ADD config /config
ADD etc /etc

ADD supervisord.conf /etc/supervisor/conf.d/nginx.conf
EXPOSE 80
