#!/bin/sh 

DEMO="JBoss BPM Suite BAM Dashboard Demo"
AUTHORS="Christina Lin, MW SA APAC"
JBOSS_HOME=../target/jboss-eap-6.1
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
SERVER_MODULE=$JBOSS_HOME/modules/





echo "  - install PostGres DataSources..."
echo
chmod u+x $JBOSS_HOME/bin/jboss-cli.sh
sh $JBOSS_HOME/bin/jboss-cli.sh --connect --file=postgresDS.cli 

echo "  - Reload after Datasource Setting"
sh $JBOSS_HOME/bin/jboss-cli.sh --connect --command=:reload

