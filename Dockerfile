###### repository server (nginx)
FROM qnib/supervisor
MAINTAINER "Christian Kniep <christian@qnib.org>"

RUN yum install -y yum-utils createrepo 


## nginx
RUN yum install -y nginx
ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf 
ADD etc/supervisord.d/nginx.ini /etc/supervisord.d/nginx.ini

VOLUME /repo

CMD /bin/supervisord -c /etc/supervisord.conf
