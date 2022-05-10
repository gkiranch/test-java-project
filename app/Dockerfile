# syntax=docker/dockerfile:1
FROM node:12-alpine
#RUN apk add --no-cache \
#    ca-certificates
#COPY ca/* /usr/local/share/ca-certificates/
#RUN update-ca-certificates
RUN apk add --no-cache bash
COPY encrypt-poi.jar .
COPY entrypoint.sh /usr/local/bin
RUN apk add --no-cache python2 g++ make
RUN apk add py3-pip
RUN pip3 install sdkms-cli --ignore-installed
WORKDIR /app
COPY . .
#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
#RUN chmod +x entrypoint.sh
#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
#CMD java -jar decrypt.jar
