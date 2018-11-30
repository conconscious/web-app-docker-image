FROM ubuntu:16.04
ENV HOME=/root
RUN apt-get update
RUN apt install apt-utils perl -y
RUN apt-get -f dist-upgrade -y
RUN apt-get install git -y
RUN apt-get install apache2 -y
RUN apt-get clean
WORKDIR /
RUN git clone https://github.com/espiderinc/web-app-docker-demo
WORKDIR /web-app-docker-demo/
RUN git checkout -b test-003
RUN git pull origin test-003
RUN cp index.html /var/www/html
RUN service apache2 restart
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGOUND"]
