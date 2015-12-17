***********environment setting************
.LIB '.\035lib\sm046005-1j.hspice' ff
.option nopage nomod acct post=1 badchr numdgt=4
.global vdd gnd

***********parameter*********************
.param TD=10ns
.param TR=0.1ns
.param TF=0.1ns
.param PW=50ns
.param PER=100ns
.param TEND=200ns

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
cload OUT gnd 1e-12

*BUFFER 	VDD GND IN OUT
XBUFFER 	VDD GND IN OUT BUFFER

Vin1 IN 	GND PULSE 0 3.3 TD TR TF PW PER

.option captab
.tran   0.01n   TEND

*****************************************

.end