JBoss BPM Suite BAM Dashboard Builder Demo Quickstart Guide
============================================================

Demo based on JBoss products.


Setup and Configuration
-----------------------

See Quick Start Guide in project as ODT and PDF for details on installation. For those that can't wait:

- see README in 'installs' directory

- add products 

- run 'init.sh' & read output

- add users in JBoss EAP server (root & erics)

- jboss-eap-6/bin/add-user.sh

  - Management User (root), select password of your choice.

  - Application User (erics), select password of your choice, assign groups 'user,admin'.

- start JBoss EAP server

- login to dashbuilder (http://localhost:8080/dashbuilder) with user 'erics' and password assigned.


Supporting Articles
-------------------

[JBoss BPM BAM Dashboard Preview in the OpenShift Cloud] (http://www.schabell.org/2013/06/jboss-bpm-bam-dashboard-in-openshift-cloud.html)

Released versions
-----------------

See the tagged releases for the following versions of the product:

- v1.1 is BPM Suite BAM Dashboard Beta standalone, running on JBoss EAP 6.1, with lab documentation and Postgresql options for
	datasources.

- v1.0 is BPM Suite BAM Dashboard Beta standalone, running on JBoss EAP 6.1.

