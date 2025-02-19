# Use nginx base image
FROM nginx:stable-alpine

# Copy only necessary files first (caching layers)
COPY ./project/index.html /usr/share/nginx/html/
COPY ./project/css /usr/share/nginx/html/css
COPY ./project/js /usr/share/nginx/html/js
COPY ./project/images /usr/share/nginx/html/images
COPY ./project/fonts /usr/share/nginx/html/fonts

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
