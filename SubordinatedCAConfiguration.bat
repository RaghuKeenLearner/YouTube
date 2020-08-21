@ECHO off
NOTEPAD C:\WINDOWS\CAPOLICY.INF
ECHO ################################################################
ECHO Publish Root CA (AIA) Certifictae and CRL list in AD.

ECHO ################### CHECK THE CERTIFICATE NAMES BEFORE PROCEEDING ###################################

certutil.exe -dsPublish -f "C:\Temp\OfflineRootCA_Certs\ROOTCA_OfflineROOTCA.crt" RootCA
PAUSE

certutil.exe -dsPublish -f "C:\Temp\OfflineRootCA_Certs\OfflineROOTCA.crl" RootCA
PAUSE

ECHO Add Root CA (AIA) certificate and CRL list into the local certifctae store. 

ECHO ################### CHECK THE CERTIFICATE NAMES BEFORE PROCEEDING ###################################

certutil.exe -addstore -f root "C:\Temp\OfflineRootCA_Certs\ROOTCA_OfflineROOTCA.crt"
PAUSE

certutil.exe -addstore -f root "C:\Temp\OfflineRootCA_Certs\OfflineROOTCA.crl"
PAUSE

ECHO ################################################################ INSTALL ADCS ROLE NOW before proceeding  ################################################################
PAUSE

PAUSE

ECHO have you installed the role? 
Pause

ECHO #####################Configure certificate revocation and CA Validity Periods###########################################
pause

certutil -setreg CA\CRLPeriodUnits 1
PAUSE

certutile -setreg CA\CRLPeriod "Weeks"
PAUSE

certutil -setreg CA\CRLDeltaPeriodUnits 1
PAUSE

certutil -setreg CA\CRLDeltaPeriod "Days"
PAUSE

ECHO ################################################################
ECHO Define CRL Overlap Settings

certutil.exe -setreg CA\CRLOverLapPeriodUnits 12
PAUSE

certutil.exe -setreg CA\CRLOverLapPeriod "Weeks"
PAUSE

ECHO ################################################################

ECHO This command will set the maximum certificate validity period of certificates issued by this CA

certutil.exe -setreg CA\ValidityPeriodUnits 10
PAUSE

ECHO ########################### STOPPING the AD CS Services   #####################################

net stop certsvc

ECHO ########################### STARTING the AD CS Services   #####################################

net start certsvc
pause