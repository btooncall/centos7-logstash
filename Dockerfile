FROM btooncall/centos7

RUN mkdir -p /opt/ 2>/dev/null; 
WORKDIR /opt/

RUN wget -q https://download.elastic.co/logstash/logstash/packages/centos/logstash-2.3.2-1.noarch.rpm \
      && yum -y install /opt/logstash-2.3.2-1.noarch.rpm \
      && rm -f /opt/logstash-2.3.2-1.noarch.rpm \
      && yum clean all

ADD logstash.conf /etc/
WORKDIR /opt/logstash

EXPOSE 12201 514 514/udp

VOLUME [ "/var/log/logstash/"]

ENTRYPOINT [ "bin/logstash", "--config=/etc/logstash.conf" ]
