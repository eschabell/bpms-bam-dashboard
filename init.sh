#!/bin/sh 
DEMO="JBoss BPM Suite BAM Dashboard Demo"
AUTHORS="Eric D. Schabell, Christina Lin"
PROJECT="https://github.com/eschabell/bpms-bam-dashboard.git"
JBOSS_HOME=./target/jboss-eap-6.1
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
SERVER_MODULE=$JBOSS_HOME/modules/
SUPPORT_DIR=./support
SRC_DIR=./installs
EAP=jboss-eap-6.1.0.zip

# wipe screen.
clear 

echo
echo "##################################################################"
echo "##                                                              ##"   
echo "##  Setting up the ${DEMO}           ##"
echo "##                                                              ##"   
echo "##                                                              ##"   
echo "##              ####   ####    #   #    ###                     ##"
echo "##              #   #  #   #  # # # #  #                        ##"
echo "##              ####   ####   #  #  #   ##                      ##"
echo "##              #   #  #      #     #     #                     ##"
echo "##              ####   #      #     #  ###                      ##"
echo "##                                                              ##"   
echo "##                                                              ##"   
echo "##  brought to you by,                                          ##"   
echo "##             ${AUTHORS}                  ##"
echo "##                                                              ##"   
echo "##  ${PROJECT}         ##"
echo "##                                                              ##"   
echo "##################################################################"
echo

echo "Setup for optional Postgresql installation, see BAM lab guide documentation."
echo
chmod u+x $SUPPORT_DIR/installPostgres.sh

# make some checks first before proceeding.	
if [[ -r $SRC_DIR/$EAP || -L $SRC_DIR/$EAP ]]; then
		echo EAP sources are present...
		echo
else
		echo Need to download $EAP package from the Customer Support Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi

# Create the target directory if it does not already exist.
if [ ! -x target ]; then
		echo "  - creating the target directory..."
		echo
		mkdir target
else
		echo "  - detected target directory, moving on..."
		echo
fi

# Move the old JBoss instance, if it exists, to the OLD position.
if [ -x $JBOSS_HOME ]; then
		echo "  - existing JBoss Enterprise EAP 6 detected..."
		echo
		echo "  - moving existing JBoss Enterprise EAP 6 aside..."
		echo
		rm -rf $JBOSS_HOME.OLD
		mv $JBOSS_HOME $JBOSS_HOME.OLD

		# Unzip the JBoss EAP instance.
		echo Unpacking JBoss Enterprise EAP 6...
		echo
		unzip -q -d target $SRC_DIR/$EAP
else
		# Unzip the JBoss EAP instance.
		echo Unpacking new JBoss Enterprise EAP 6...
		echo
		unzip -q -d target $SRC_DIR/$EAP
fi

echo "  - enabling demo accounts logins in application-users.properties file..."
echo
cp $SUPPORT_DIR/application-users.properties $SERVER_CONF

echo "  - enabling demo accounts role setup in application-roles.properties file..."
echo
cp $SUPPORT_DIR/application-roles.properties $SERVER_CONF

echo "  - enabling demo accounts role setup in mgmt-users.properties file..."
echo
cp $SUPPORT_DIR/mgmt-users.properties $SERVER_CONF

echo "  - deploying bam dashboard file..."
echo
cp $SUPPORT_DIR/dashboardbuilder-bpms.war $SERVER_DIR

echo "  - install JDBC Drivers..."
echo
cp $SUPPORT_DIR/layers.conf $SERVER_MODULE
cp -R $SUPPORT_DIR/jdbc  $SERVER_MODULE/system/layers/

# Add execute permissions to the standalone.sh script.
echo "  - making sure standalone.sh for server is executable..."
echo
chmod u+x $JBOSS_HOME/bin/standalone.sh

echo "See BAM lab guide documentation for more details on demonstrating the BAM component functionality."
echo

echo "${DEMO} Setup Complete."
echo

