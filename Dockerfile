FROM msdjl/tomcat_https
ENV PORTAL_DB="10.36.6.50/sv"
ENV PORTAL_BRANCH="Trunk"
ENV PORTAL_JOB="portal_trunk"
ADD configure_portal.sh ${CATALINA_HOME}/bin/
RUN sed -i '/#placeholder#/r bin/configure_portal.sh' ${CATALINA_HOME}/bin/entrypoint.sh
