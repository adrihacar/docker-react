#temp container
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
run npm install
COPY . .
RUN npm run build


#then we copy just what we want
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html