# Web Front End for testssl.sh

This project is a web interface for [testssl.sh](https://testssl.sh/). It can be used to offer internal TLS/SSL configuration check portals, whereever the usual public tools are not applicable. It is available as Docker image.

## Installation

1. docker run -p 5000:5000 testssl.sh-web:latest

## NGINX Reverse Proxy

If you would like to run behind a NGINX Reverse Proxy simply add this to your configuration file in sites-enabled. 
If you want to add security to it look at nginx module [basic_auth](http://nginx.org/en/docs/http/ngx_http_auth_basic_module.html).

     location /testssl/ {
          proxy_pass http://127.0.0.1:5000/;
          gzip_types text/plain application/javascript;
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "upgrade";
          proxy_connect_timeout 200;  # you might need to increase these values depending on your server hardware. 
          proxy_send_timeout 200;     # you might need to increase these values depending on your server hardware. 
          proxy_read_timeout 200;     # you might need to increase these values depending on your server hardware. 
          send_timeout 200;           # you might need to increase these values depending on your server hardware. 
     }
