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
.param TEND=1.6ms

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
cload OUT gnd 1e-12

*POINT  	VDD GND  NPA  NPB  NGA  NGB  NOUTG  NOUTP
XTESTPOINT 	VDD GND  NPA  NPB  NGA  NGB  NOUTG  NOUTP POINT

Vin1 NGA GND PULSE 0 3.3 TD TR TF PW PER
Vin2 NGB GND PULSE 0 3.3 TD TR TF '2*PW' '2*PER'
Vin3 NPA GND PULSE 0 3.3 TD TR TF '4*PW' '4*PER'
Vin4 NPB GND PULSE 0 3.3 TD TR TF '8*PW' '8*PER'

.option captab
.tran   0.01n   TEND

*****************************************

.end