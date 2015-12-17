***********environment setting************
.LIB '.\035lib\sm046005-1j.hspice' ff
.option nopage nomod acct post=1 badchr numdgt=4
.global vdd gnd

***********parameter*********************
*.param T1=0
*.param T2=500e-007
*.param T3=500.01e-007
*.param T4=1001.01e-007
*.param T5=1001.02e-007
*.param T6=2001.02e-007
.param TD=10us
.param TR=1us
.param TF=1us
.param PW=50us
.param PER=100us
.param TEND=500us

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
cload OUT gnd 1e-12

*	G  VDD  GND  A  B  NG
XTESTG VDD 	GND  A  B OUT G 

Vin1 A GND PULSE 0 3.3 TD TR TF PW PER
Vin2 B GND PULSE 0 3.3 TD TR TF '2*PW' '2*PER'

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