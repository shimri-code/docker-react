# use an existing image as base 
# phase 1 build  
FROM node:16-alpine as builder

# working dir 
WORKDIR /app

# copy package.json
COPY ./package.json ./ 

# Download and install 
RUN npm install

# copy all
COPY ./ ./ 

# build   
RUN npm run build

# phase 2 server  
FROM nginx

# copy the build 
COPY --from=builder /app/build /usr/share/nginx/html
