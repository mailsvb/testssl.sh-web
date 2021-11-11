FROM alpine:latest

RUN mkdir -p /testssl/log && mkdir -p /testssl/result/html && mkdir -p testssl/result/json
ADD static /testssl/static
ADD templates /testssl/templates
ADD SSLTestPortal.py /testssl/SSLTestPortal.py

RUN apk update && apk upgrade && \
    apk add --update --no-cache python3 py3-pip aha git bash coreutils procps openssl bind-tools && \
    ln -sf python3 /usr/bin/python && \
    pip3 install flask &&\
    git clone --depth 1 https://github.com/drwetter/testssl.sh.git /testssl.sh && \
    apk del py3-pip git

WORKDIR /testssl
EXPOSE 5000
CMD python SSLTestPortal.py
