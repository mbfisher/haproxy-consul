#!/bin/bash
#https://github.com/haproxytech/haproxy/tree/master/blog/ssl_client_certificate_management_at_application_level

# certificate authority creation
openssl genrsa -out ca.key 4096
openssl req -new -x509 -days 365 -key ca.key -out ca.crt
cat ca.crt > ca.pem

# server certificate creation
openssl genrsa -out server.key 1024
openssl req -new -key server.key -out server.csr
openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt
cat server.crt server.key > server.pem

# client certificate creation
openssl genrsa -out client.key 1024
openssl req -new -key client.key -out client.csr
openssl x509 -req -days 365 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 02 -out client.crt
cat client.crt client.key > client.pem
openssl pkcs12 -export -out client.pfx -inkey client.key -in client.crt -certfile ca.crt
