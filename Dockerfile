FROM msdjl/tomcat_https
ENV PORTAL_DB="10.36.6.50/sv"
ENV JENKINS_ARTIFACT_URL="http://10.36.6.10:9090/view/Trunk/job/portal_trunk/lastSuccessfulBuild/artifact/portal/dist/employee-portal.war"
ENV BLOCK_EM7="false"
ADD configure_portal.sh ${CATALINA_HOME}/bin/
RUN sed -i '/#placeholder#/r bin/configure_portal.sh' ${CATALINA_HOME}/bin/entrypoint.sh
