FROM btooncall/centos7:devel

RUN mkdir -p /opt/ 2>/dev/null; 
WORKDIR /opt/

RUN wget -q https://download.elastic.co/logstash/logstash/packages/centos/logstash-2.3.2-1.noarch.rpm \
      && yum -y install /opt/logstash-2.3.2-1.noarch.rpm \
      && rm -f /opt/logstash-2.3.2-1.noarch.rpm \
      && yum clean all

ADD logstash.conf /etc/
WORKDIR /opt/logstash

ENV JAVA_HOME /etc/alternatives/jre_1.7.0_openjdk

EXPOSE 12201/udp

VOLUME [ "/var/log/logstash/"]

ENTRYPOINT [ "bin/logstash", "--config=/etc/logstash.conf" ]
