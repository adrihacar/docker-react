#temp container
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
run npm install
COPY . .
RUN npm run build


#then we copy just what we want
FROM nginx
#use for AWS, elastic beanstalk map this port
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html