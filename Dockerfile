FROM node:alpine as teamalpha  
WORKDIR /var/app   
COPY ./package.json ./
RUN npm instal
COPY ./ ./
RUN npm run build

# as teamalpha = added alies to a block
# the above is a particular block of the docker file.
# Its scope is from FROM to FROM

FROM nginx
EXPOSE 80
COPY --from=teamalpha /var/app/build /usr/share/nginx/html





