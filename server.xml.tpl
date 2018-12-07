<?xml version='1.0' encoding='utf-8'?>
<Server port="8005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />

  <GlobalNamingResources>
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>

  <Service name="Catalina">

    <Connector port="{{ TOMCAT_PORT | default('8080') }}" protocol="HTTP/1.1"
               connectionTimeout="{{ TOMCAT_CONNECTION_TIMEOUT | default('20000') }}"
	       acceptCount="{{ TOMCAT_ACCEPTCOUNT | default('200') }}"
	       maxThreads="{{ TOMCAT_MAXTHREADS | default('400') }}"
	       useBodyEncodingForURI="true" URIEncoding="UTF-8"
               redirectPort="8443" />

    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" />

    <Engine name="Catalina" defaultHost="localhost">

    <Realm className="org.apache.catalina.realm.LockOutRealm">
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
    </Realm>

    <Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="true">
	      {% if OPENACCESS %}
	    <Valve className="org.apache.catalina.valves.AccessLogValve" directory="/acs/log"
               prefix="access" suffix=".log"
               pattern="%h %l %u %t &quot;%r&quot; %s %b" />
	      {% endif %}
    </Host>

   </Engine>

  </Service>

</Server>
