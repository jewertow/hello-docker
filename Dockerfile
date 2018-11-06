FROM freedomkk/tomcat-maven

COPY pom.xml /tmp
COPY /src /tmp/src

WORKDIR /tmp
RUN mvn install
RUN mv /tmp/target/demo.war /usr/local/tomcat/webapps

ENTRYPOINT /usr/local/tomcat/bin/catalina.sh start && tail -f /usr/local/tomcat/logs/catalina.out