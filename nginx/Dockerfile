# Use the Nginx image
FROM nginx

# Remove the default nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

# Replace with our own nginx.conf
COPY fullchain.pem          /etc/nginx/fullchain.pem
COPY privkey.pem            /etc/nginx/privkey.pem

# Replace with our own nginx.conf
COPY academyfullchain.pem         /etc/nginx/academyfullchain.pem
COPY academyprivkey.pem            /etc/nginx/academyprivkey.pem

COPY options-ssl-nginx.conf /etc/nginx/options-ssl-nginx.conf
COPY ssl-dhparams.pem       /etc/nginx/ssl-dhparams.pem
COPY nginx.conf /etc/nginx/conf.d/