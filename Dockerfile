# 1. Use an official Nginx image to serve static files
FROM nginx:alpine

# 2. Set build argument to switch between environments
ARG ENV=production
ENV APP_ENV=$ENV

# 3. Copy custom Nginx configuration file (optional)
# You can customize this for staging, production, or other needs
COPY nginx.conf /etc/nginx/nginx.conf

# 4. Copy the HTML, CSS, JS files into the appropriate directory in the container
COPY ./dist/ /usr/share/nginx/html/

# 5. Expose the default HTTP port
EXPOSE 80

# 6. Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
