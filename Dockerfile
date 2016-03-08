FROM fedora:latest

MAINTAINER docker@jeroen.se

# Update and install packages.
RUN dnf update -y
RUN dnf install -y php php-mbstring php-pdo php-gd unzip wget

# Install kanboard it self
WORKDIR /var/www/html/ 
RUN wget http://kanboard.net/kanboard-latest.zip
RUN unzip kanboard-latest.zip
RUN mv kanboard kanboard-jnieuwen
RUN mv kanboard-jnieuwen/* .

RUN chown -R apache:apache data

# Clean up the files we don't need.
RUN rm -rf kanboard-jnieuwen
RUN rm -f kanboard-latest.zip

# Expose port 80
EXPOSE 80

# Start httpd in the foreground.
CMD [ "/usr/sbin/httpd", "-DFOREGROUND" ]

