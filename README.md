# Usage

* Setup TLS:

    $> cd www; ./ssl.sh

* Add docker URL to /etc/hosts for example.com

    $> curl -v -E www/client.pfx:pass --cacert www/ca.crt https://example.com:8443

# References

https://www.digitalocean.com/community/tutorials/how-to-implement-ssl-termination-with-haproxy-on-ubuntu-14-04
http://blog.haproxy.com/2013/06/13/ssl-client-certificate-information-in-http-headers-and-logs/
