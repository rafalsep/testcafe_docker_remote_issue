FROM node:12.14.0
WORKDIR /usr/app
EXPOSE 3000
EXPOSE 5080
EXPOSE 5081
EXPOSE 5000
CMD ["tail", "-f", "/dev/null"]