@echo off
SET DEMO="JBoss BPM Suite BAM Dashboard Demo"
SET AUTHORS="Eric D. Schabell"
SET PROJECT="https://github.com/eschabell/bpms-bam-dashboard.git"
SET JBOSS_HOME=.\target\jboss-eap-6.1
SET SERVER_DIR=%JBOSS_HOME%\standalone\deployments\
SET SERVER_CONF=%JBOSS_HOME%\standalone\configuration\
SET SERVER_MODULE=%JBOSS_HOME%\modules\
SET SRC_DIR=.\installs
SET EAP=jboss-eap-6.1.0.zip

REM wipe screen.
cls 

echo
echo "##################################################################"
echo "##                                                              ##"   
echo "##  Setting up the %DEMO%         ##"
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
echo "##             %AUTHORS%                               ##"
echo "##                                                              ##"   
echo "##  %PROJECT%##"
echo "##                                                              ##"   
echo "##################################################################"
echo


REM Make some checks before proceeding.
if exist %SRC_DIR%\%EAP% (
	echo EAP sources are present...
	echo.
) else (
	echo Need to download %EAP% package from the Customer Support Portal
	echo and place it in the %SRC_DIR% directory to proceed...
	echo.
	GOTO :EOF
)

REM Create the target directory if it does not already exist
if not exist target (
	echo  - creating the target directory...
	echo.
	mkdir target
) else (
	echo  - detected target directory, moving on...
	echo.
)

echo %JBOSS_HOME%

REM Move the old JBoss instance, if it exists, to the OLD position.
REM if exist %JBOSS_HOME% (
REM  	echo  - existing JBoss Enterprise EAP 6 detected...
REM  	echo.
REM  	echo  - moving existing JBoss Enterprise EAP 6 aside...
REM  	echo.
REM 	
REM 	if exist "%JBOSS_HOME%.OLD" (
REM 		rmdir \s \q "%JBOSS_HOME%.OLD"
REM 	)
REM 	
REM  	move "%JBOSS_HOME%" "%JBOSS_HOME%.OLD"
REM 	
REM 	REM Unzip the JBoss EAP instance.
REM 	echo.
REM  	echo Unpacking JBoss Enterprise EAP 6...
REM  	echo.
REM  	cscript \nologo unzip.vbs %SRC_DIR%\%EAP% target
REM 	
REM  ) else (
REM 		
REM 	Unzip the JBoss EAP instance.
REM  	echo Unpacking new JBoss Enterprise EAP 6...
REM  	echo.
REM  	cscript \nologo unzip.vbs %SRC_DIR%\%EAP% target
REM )

echo "  - deploying bam dashboard file..."
echo
copy support\dashboardbuilder-bpms.war %SERVER_DIR%


echo "  - install JDBC Drivers..."
echo
copy support\layers.conf %SERVER_MODULE%
xcopy support\jdbc %SERVER_MODULE%system\layers\jdbc  /E/K/Y/C/H/I


