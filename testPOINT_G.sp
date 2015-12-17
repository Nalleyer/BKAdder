***********environment setting************
.LIB '.\035lib\sm046005-1j.hspice' ff
.option nopage nomod acct post=1 badchr numdgt=4
.global vdd gnd

***********parameter*********************
.param TD=10us
.param TR=1us
.param TF=1us
.param PW=50us
.param PER=100us
.param TEND=800us

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
cload OUT gnd 1e-12

*  POINT_G 		VDD GND  NP  NG  NCI0  NOUTG  OUTG
XTESTPOINT_G	VDD GND  NP  NG  NCI0  NOUTG  OUTG POINT_G

Vin1 NG 	GND PULSE 0 3.3 TD TR TF PW PER
Vin2 NCI0	GND PULSE 0 3.3 TD TR TF '2*PW' '2*PER'
Vin3 NP 	GND PULSE 0 3.3 TD TR TF '4*PW' '4*PER'

.option captab
.tran   0.01n   TEND

*****************************************

.end