
FROM openjdk:8-jre

COPY certificate.pfx $JAVA_HOME/jre/lib/security/certificate.pfx

RUN \
    cd $JAVA_HOME/jre/lib/security \
    keytool -importkeystore -srckeystore certificate.pfx -srcstorepass -changeit -srcstoretype pkcs12 -destkeystore cacerts -deststorepass changeit -deststoretype JKS

RUN mkdir -p /opt/shinyproxy/
COPY application.yml /opt/shinyproxy/application.yml
COPY shinyproxy.jar /opt/shinyproxy/shinyproxy.jar
ADD templates /opt/shinyproxy/templates


WORKDIR /opt/shinyproxy/
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]