# Use the Nginx image
FROM nginx

# Remove the default nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

# Replace with our own nginx.conf
COPY fullchain.pem          /etc/nginx/fullchain.pem
COPY privkey.pem            /etc/nginx/privkey.pem

COPY nginx.conf /etc/nginx/conf.d/