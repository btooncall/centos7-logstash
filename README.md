# centos7-logstash

run with            : docker run -d -P -h loghost --name loghost -v logstash-logs:/var/log/logstash btooncall/centos7-logstash

investigate ports   : docker port &lt;container_id&gt;

watch logstash logs : docker logs -f &lt;container_id&gt;

shell inside container :  docker exec -it &lt;container_id&gt; /bin/bash

