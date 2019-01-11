**java-ee-7-docker-jboss-eap-6.4-example**

JavaEE 7: Servlet/JSP/WEB/JBoss EAP 6.4 in Docker

debug application and JBoss in docker configs

Dockerfile

```Dockerfile
FROM daggerok/jboss-eap-6.4
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005\"" >> ${JBOSS_HOME}/bin/standalone.conf
EXPOSE 5005
ENTRYPOINT bash -c 'echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> ${JBOSS_HOME}/bin/standalone.conf && ${JBOSS_HOME}/bin/standalone.sh'
ADD ./target/*.war ${JBOSS_HOME}/standalone/deployments/servlets.war~~~~
```

docker-compose.yaml

```yml
version: '2.1'
services:
  servlets:
    build: .
    ports:
      - '8080:8080'
      - '5005:5005'
```

build and run using docker-compose-maven-plugin (see pom.xml)

```bash
./mvnw ; ./mvnw -Pdocker docker-compose:up

open http://localhost:8080/servlets/CookieServlet

./mvnw -Pdocker docker-compose:down
```



 
   
