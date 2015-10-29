# download portal
if [ -z $(ls ${CATALINA_HOME}/webapps/ | grep portal) ]; then
wget -O ${CATALINA_HOME}/webapps/portal.war http://10.36.6.10:9090/view/${PORTAL_BRANCH}/job/${PORTAL_JOB}/lastSuccessfulBuild/artifact/portal/dist/employee-portal.war
fi

# extract .war
if [ -n $(ls ${CATALINA_HOME}/webapps/ | grep portal.war) ]; then
unzip -d ${CATALINA_HOME}/webapps/portal ${CATALINA_HOME}/webapps/*portal.war
rm ${CATALINA_HOME}/webapps/*portal.war
fi

# change db address
DB_URL="jdbc:postgresql://${PORTAL_DB}"
sed -i s#^jdbc.mmdb.url=.*#jdbc.mmdb.url=${DB_URL}#g ${CATALINA_HOME}/webapps/portal/WEB-INF/env.properties
sed -i s#^jdbc.rt.url=.*#jdbc.rt.url=${DB_URL}#g ${CATALINA_HOME}/webapps/portal/WEB-INF/env.properties
