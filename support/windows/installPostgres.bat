@echo off
SET DEMO="JBoss BPM Suite BAM Dashboard Demo"
SET AUTHORS="Eric D. Schabell"
SET JBOSS_HOME=..\..\target\jboss-eap-6.1
SET SERVER_DIR=%JBOSS_HOME%\standalone\deployments\
SET SERVER_CONF=%JBOSS_HOME%\standalone\configuration\
SET SERVER_MODULE=%JBOSS_HOME%\modules\




echo "  - install PostGres DataSources..."
echo
%JBOSS_HOME%\bin\jboss-cli.bat --connect --file=postgresDS.cli 

echo "  - Reload after Datasource Setting"
sh %JBOSS_HOME%\bin\jboss-cli.bat --connect --command=:reload
