FROM daggerok/jboss-eap-6.4
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005\"" >> ${JBOSS_HOME}/bin/standalone.conf
EXPOSE 5005
ENTRYPOINT bash -c 'echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> ${JBOSS_HOME}/bin/standalone.conf && ${JBOSS_HOME}/bin/standalone.sh'
ADD ./target/*.war ${JBOSS_HOME}/standalone/deployments/servlets.war
