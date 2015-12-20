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
.param TEND=800ns

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
cload OUT gnd 1e-12

*POINT_G1  		VDD  GND  NP  NG  NCI0  OUTG
XTESTPOINT_G1	VDD  GND  NP  NG  NCI0  OUTG POINT_G1

Vin1 NG 	GND PULSE 0 3.3 TD TR TF PW PER
Vin2 NCI0	GND PULSE 0 3.3 TD TR TF '2*PW' '2*PER'
Vin3 NP 	GND PULSE 0 3.3 TD TR TF '4*PW' '4*PER'

.option captab
.tran   0.01n   TEND

*****************************************

*
*.meas tran top_i max v(A)
*.meas tran top_o max v(out)
*.measure tran delayr trig v(A)  val='0.5*top_i' rise=1
*+                    targ v(out) val='0.5*top_o' rise=1
*.measure tran transr trig v(out) val='0.2*top_o' rise=1
*+                    targ v(out) val='0.8*top_o' rise=1
*
*.measure tran delayf trig v(A)  val='0.5*top_i' fall=1
*+                    targ v(out) val='0.5*top_o' fall=1
*.measure tran transf trig v(out) val='0.8*top_o' fall=1
*+                    targ v(out) val='0.2*top_o' fall=1

.end