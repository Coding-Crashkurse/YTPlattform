
FROM openjdk:8-jre

RUN mkdir -p /opt/shinyproxy/

COPY certificate.pfx $JAVA_HOME/jre/lib/security/certificate.pfx

RUN \
    cd $JAVA_HOME/jre/lib/security \
    keytool -importkeystore -srckeystore certificate.pfx -srcstorepass -changeit -srcstoretype pkcs12 -destkeystore cacerts -deststorepass changeit -deststoretype JKS

COPY shinyproxy.jar /opt/shinyproxy/shinyproxy.jar
COPY application.yml /opt/shinyproxy/application.yml
COPY templates /opt/shinyproxy/templates


WORKDIR /opt/shinyproxy/
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]