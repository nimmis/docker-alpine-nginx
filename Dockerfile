FROM nimmis/alpine-micro

MAINTAINER nimmis <kjell.havneskold@gmail.com>

RUN apk update && apk upgrade && \
    apk add nginx && \
    mkdir /web && \
# chown -R apache.apache /web && \
#    sed -i 's#^DocumentRoot ".*#DocumentRoot "/web/html"#g' /etc/apache2/httpd.conf && \
#    sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
#    sed -i 's#^ServerRoot .*#ServerRoot /web#g'  /etc/apache2/httpd.conf && \
#    sed -i 's#^IncludeOptional /etc/apache2/conf.d".*#IncludeOptional /web/config/conf.d/*.conf#g' /etc/apache2/httpd.conf && \
#    sed -i 's#PidFile "/run/.*#Pidfile "/web/run/httpd.pid"#g'  /etc/apache2/conf.d/mpm.conf && \
#    sed -i 's#Directory "/var/www/localhost/htdocs.*#Directory "/web/html" >#g' /etc/apache2/httpd.conf && \
#    sed -i 's#Directory "/var/www/localhost/cgi-bin.*#Directory "/web/cgi-bin" >#g' /etc/apache2/httpd.conf && \
    rm -rf /var/cache/apk/*


COPY service/nginx /etc/service/nginx/
COPY populate /etc/run_always/
COPY config/nginx.conf /etc/nginx/
COPY config/nginx.conf /etc/nginx/nginx.conf.default

VOLUME /web

EXPOSE 80 443

