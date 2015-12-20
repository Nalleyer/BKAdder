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
.param TEND=400ns

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
cload OUT gnd 1e-12

*SUM  			VDD  GND  NAXORB  AXORB  NC  C  S
XTESTSUM  		VDD  GND  NAXORB  AXORB  NC  C  S SUM

Vin1 NAXORB GND PULSE 0 3.3 TD TR TF PW PER
Vin2 AXORB 	GND PULSE 3.3 0 TD TR TF PW PER
Vin3 C 		GND PULSE 0 3.3 TD TR TF '2*PW' '2*PER'
Vin4 NC 	GND PULSE 3.3 0 TD TR TF '2*PW' '2*PER'

.option captab
.tran   0.01n   TEND

.end