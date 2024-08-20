FROM alpine:latest

RUN mkdir -p /testssl/log && mkdir -p /testssl/result/html && mkdir -p testssl/result/json
ADD static /testssl/static
ADD templates /testssl/templates
ADD SSLTestPortal.py /testssl/SSLTestPortal.py

RUN apk update && apk upgrade && \
    apk add --update --no-cache python3 py3-flask aha git bash coreutils procps && \
    git clone --depth 1 --branch v3.0.9 https://github.com/drwetter/testssl.sh.git /testssl.sh && \
    apk del git

RUN ln -s /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.pem
WORKDIR /testssl
EXPOSE 5000
CMD ["/usr/bin/python", "SSLTestPortal.py"]
