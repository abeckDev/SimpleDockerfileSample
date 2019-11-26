# Using Centos7 Image from Dockerhub as Base Image
FROM centos:7

# Sets a Label with information on the maintainer of the image.
# Users now know who to contact if there a problems with the image
# This information is visible in the "docker inspect" command
LABEL maintainer="Alexander.Beck@microsoft.com"

# RUN will execute the command inside of the image
# In this case I will install the httpd (Apache Server)
RUN yum -y install httpd

# Will mark this port as used by the application
# Wont actually expose the port inside docker and works more like a documentation
EXPOSE 80

#Copies the content from the dorectory htmlpages into the container image to directory /var/www/htdocs
COPY htmlpages/ /var/www/html

# Copy the httpd config to the server
COPY ./WebserverConfig.conf /etc/httpd/conf/httpd.conf

# Uses the default Entrypoin (/bin/sh) and excutes the apache binary to run in Foreground mode
CMD ["/usr/sbin/httpd", "-f", "/etc/httpd/conf/httpd.conf", "-DFOREGROUND"]
