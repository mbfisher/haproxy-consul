FROM alpine

ENV CONSUL_TEMPLATE_VERSION 0.12.2

RUN apk add --update openssl haproxy \
    && rm -rf /var/cache/apk/*

RUN wget -O /tmp/consul-template.zip https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    unzip /tmp/consul-template.zip -d /usr/local/bin

COPY haproxy.ctmpl /usr/local/etc/haproxy/haproxy.ctmpl
COPY server.pem /etc/ssl/private/server.pem
COPY ca.crt /etc/ssl/private/ca.crt

RUN touch /var/run/haproxy.pid

CMD rm -f /usr/local/etc/haproxy/haproxy.cfg && consul-template \
    -consul $CONSUL_URL \
    -template "/usr/local/etc/haproxy/haproxy.ctmpl:/usr/local/etc/haproxy/haproxy.cfg:haproxy -D -f /usr/local/etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid)"
