FROM alpine:3
RUN apk --no-cache add dnsmasq 
RUN echo "#* THIS IS THE FORWARDER TO THE VALUME FOR SIMPLE WAY OF CONFIG *#" >> /etc/dnsmasq.conf && echo "conf-dir=/etc/dnsmasq.d/,*.conf" >> /etc/dnsmasq.conf 
EXPOSE 53/udp 53/tcp
VOLUME ["/etc/dnsmasq.d"]
#dnsmasq --no-daemon --log-queries
ENTRYPOINT ["dnsmasq", "--no-daemon", "--log-queries", "--log-facility=/etc/dnsmasq.d/dnsmasq.log"]