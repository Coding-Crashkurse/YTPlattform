
FROM openjdk:8-jre

RUN mkdir -p /opt/shinyproxy/
RUN wget https://nexus.openanalytics.eu/repository/snapshots/eu/openanalytics/shinyproxy/2.5.1-SNAPSHOT/shinyproxy-2.5.1-20210521.074523-12.jar -O /opt/shinyproxy/shinyproxy.jar

COPY certificate.pfx $JAVA_HOME/jre/lib/security/certificate.pfx

RUN \
    cd $JAVA_HOME/jre/lib/security \
    keytool -importkeystore -srckeystore certificate.pfx -srcstorepass -changeit -srcstoretype pkcs12 -destkeystore cacerts -deststorepass changeit -deststoretype JKS


COPY application.yml /opt/shinyproxy/application.yml
ADD templates /opt/shinyproxy/templates


WORKDIR /opt/shinyproxy/
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]