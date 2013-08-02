#!/bin/sh 
DEMO="JBoss BPM Suite BAM Dashboard Demo"
AUTHORS="Eric D. Schabell"
PROJECT="git@github.com:eschabell/brms-customer-evaluation-demo.git"
JBOSS_HOME=./target/jboss-eap-6.1
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
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
echo "##             ${AUTHORS}                                 ##"
echo "##                                                              ##"   
echo "##  ${PROJECT}  ##"
echo "##                                                              ##"   
echo "##################################################################"
echo

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

echo "  - deploying bam dashboard file..."
echo
cp support/dashboardbuilder-bpms.war $SERVER_DIR

# Add execute permissions to the standalone.sh script.
echo "  - making sure standalone.sh for server is executable..."
echo
chmod u+x $JBOSS_HOME/bin/standalone.sh

echo "Be sure to create a 'root' user and 'erics' user as statedin README with add-user.sh"
echo
echo "Example user setup:"
echo
echo "$ ./add-user.sh 

What type of user do you wish to add? 
 a) Management User (mgmt-users.properties) 
  b) Application User (application-users.properties)
	(a): 

	Enter the details of the new user to add.
	Realm (ManagementRealm) :     
	Username : root
	The username 'root' is easy to guess
	Are you sure you want to add user 'root' yes/no? yes
	Password : 
	Re-enter Password : 
	About to add user 'root' for realm 'ManagementRealm'
	Is this correct yes/no? yes
	Added user 'root' to file
	'/Users/erics/demo-projects/bpms-bam-dashboard/target/jboss-eap-6.1/standalone/configuration/mgmt-users.properties'
	Added user 'root' to file
	'/Users/erics/demo-projects/bpms-bam-dashboard/target/jboss-eap-6.1/domain/configuration/mgmt-users.properties'
	Is this new user going to be used for one AS process to connect to another AS process? 
	e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server EJB calls.
	yes/no? no

$ ./add-user.sh 

What type of user do you wish to add? 
 a) Management User (mgmt-users.properties) 
  b) Application User (application-users.properties)
	(a): b

	Enter the details of the new user to add.
	Realm (ApplicationRealm) : 
	Username : erics
	Password : 
	Re-enter Password : 
	What roles do you want this user to belong to? (Please enter a comma separated list, or leave blank for none)[  ]: user,admin
	About to add user 'erics' for realm 'ApplicationRealm'
	Is this correct yes/no? yes
	Added user 'erics' to file
	'/Users/erics/demo-projects/bpms-bam-dashboard/target/jboss-eap-6.1/standalone/configuration/application-users.properties'
	Added user 'erics' to file
	'/Users/erics/demo-projects/bpms-bam-dashboard/target/jboss-eap-6.1/domain/configuration/application-users.properties'
	Added user 'erics' with roles user,admin to file
	'/Users/erics/demo-projects/bpms-bam-dashboard/target/jboss-eap-6.1/standalone/configuration/application-roles.properties'
	Added user 'erics' with roles user,admin to file
	'/Users/erics/demo-projects/bpms-bam-dashboard/target/jboss-eap-6.1/domain/configuration/application-roles.properties'
	Is this new user going to be used for one AS process to connect to another AS process? 
	e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server EJB calls.
	yes/no? no"	
echo
echo
echo "${DEMO} Setup Complete."
echo

