@echo Off
echo We will be making few changes to our Root CA here. Below is a really basic commands for it. More information can be found here 
Echo ##########################################################################
Define the active directory configuration partitions distinguished name

certutil -setreg ca\DSConfigDN "CN=configuration,dc=home,dc=com"
pause

certutil.exe -setreg CA\CRLOverLapPeriodUnits 3
pause

echo This will set the overlap period between the CRL and the Delta CRL

certutil.exe -setreg CA\CRLOverLapPeriodUnits 3
Pause

echo This will set the the CRL Overlap period to weeks

certutil.exe -setreg CA\CRLOverLapPeriod "Weeks"
pause

echo This command will set the maximum certificate validity period of certificates issued by this CA

certutil.exe -setreg CA\ValidityPeriodUnits 10
Pause

Echo Restarting the AD CS Services. First we stop the cert service
net stop certsvc
pause

Echo Start the service
net start certsvc
pause