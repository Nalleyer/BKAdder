***********environment setting************
.LIB '.\035lib\sm046005-1j.hspice' ff
.option nopage nomod acct post=1 badchr numdgt=4
.global vdd gnd

***********parameter*********************
.param T1=0
.param T2=1000e-007
.param T3=1000.01e-007
*.param T4=1001.01e-007
*.param T5=1001.02e-007
.param T6=2001.02e-007

***********includes**********************
.include 'net.sp'

* test1 A0 0->1 S14 0->1 : 0xBFFE(F) + 0x0001 = 0xC000
* test2 A0 0->1 S14 1->0 : 0x7FFE(F) + 0x0001 = 0x8000
* test3 A0 1->0 S14 0->1 : 0x7FFF(E) + 0x0001 = 0x7FFF
* test4 A0 1->0 S14 1->0 : 0xBFFF(E) + 0x0001 = 0xBFFF
XADD1 VDD GND VDD VDD VDD VDD VDD VDD VDD VDD VDD VDD VDD VDD VDD IN
+ GND GND GND GND GND GND GND GND GND GND GND GND GND GND GND VDD
+ OUT<15> OUT OUT<13> OUT<12> OUT<11> OUT<10> OUT<9> OUT<8> 
+ OUT<7> OUT<6> OUT<5> OUT<4> OUT<3> OUT<2> OUT<1> OUT<0>
+ CIN COUT BKADDER

cload OUT gnd 1e-12

vbias vdd gnd 3.3
vin in gnd pwl T1 0 T2 0 T3 3.3 

.option captab
.tran   0.01n   T6

.meas tran top_i max v(in)
.meas tran top_o max v(out)
.measure tran delayr trig v(in)  val='0.5*top_i' rise=1
+                    targ v(out) val='0.5*top_o' rise=1
.measure tran transr trig v(out) val='0.2*top_o' rise=1
+                    targ v(out) val='0.8*top_o' rise=1

.measure tran delayf trig v(in)  val='0.5*top_i' fall=1
+                    targ v(out) val='0.5*top_o' fall=1
.measure tran transf trig v(out) val='0.8*top_o' fall=1
+                    targ v(out) val='0.2*top_o' fall=1

.end