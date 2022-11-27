#### doker-webapp-cicd/Dokerfile

# import nginx last verion container
FROM nginx:latest

# copy dir webapp content to /usr/share/nginx/html/
COPY webapp/index.html /usr/share/nginx/html/index.html

# expose webapp on internet
EXPOSE 80
