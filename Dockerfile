FROM node:16-alpine3.14
ADD . /var/www/
WORKDIR /var/www
EXPOSE 20163
CMD ["node", "server.js"]
