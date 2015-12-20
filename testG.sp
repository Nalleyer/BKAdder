***********environment setting************
.LIB '.\035lib\sm046005-1j.hspice' ff
.option nopage nomod acct post=1 badchr numdgt=4
.global vdd gnd

***********parameter*********************
.param TD=10ns
.param TR=0.01ns
.param TF=0.01ns
.param PW=50ns
.param PER=100ns
.param TEND=500ns

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
*cload OUT gnd 1e-12

*	G  VDD  GND  A  B  NG
XTESTG VDD 	GND  A  B OUT G 

Vin1 A GND PULSE 0 3.3 TD TR TF PW PER
Vin2 B GND PULSE 0 3.3 TD TR TF '2*PW' '2*PER'

.option captab
.tran   0.01n   TEND

.end