FROM rockylinux:9

MAINTAINER "Rakesh | https://rakeshkumarjangid.hashnode.dev/"

RUN dnf update -y && \
    dnf install epel-release -y && \
    dnf install https://rpms.remirepo.net/enterprise/remi-release-9.rpm -y && \
    dnf module install php:remi-7.4 -y

RUN yum install iproute procps-ng vim bind-utils wget nmap net-tools httpd iputils -y && \
    yum install php-cli php-pear php-pdo php-mysqlnd php-gd php-mbstring php-mcrypt php-xml -y 

RUN mkdir -p /var/www/html/ 

ADD https://wordpress.org/latest.zip /var/www/html/

#COPY /root/docker/APACHECONF/ /etc/httpd/conf/ 

#COPY /root/docker/INSTRUCTIONS/  /

WORKDIR /var/www/html

RUN unzip ./latest.zip && rm -rf latest.zip

RUN chown -R apache:apache /var/www/html/wordpress && \
    chmod -R 755  /var/www/html/wordpress && \
    mkdir -p /run/php-fpm/ && \
    touch /run/php-fpm/www.sock

CMD echo "Open /root/Instructions.txt file to use this container image"
