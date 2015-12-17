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
.param TEND=200us

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
cload OUT gnd 1e-12

*.subckt  BKADDER  A15  A14  A13  A12  A11  A10  A9  A8  A7  A6  A5  A4  A3  A2  A1  A0
* +B15  B14  B13  B12  B11  B10  B9  B8  B7  B6  B5  B4  B3  B2  B1  B0
* +S15  S14  S13  S12  S11  S10  S9  S8  S7  S6  S5  S4  S3  S2  S1  S0
* +CI0  CO15

*****************
**test1: 0000 0000 0000 0000 + 0000 0000 0000 0000 + 0->1 (Ci0)
XBKADDER 	GND GND GND GND GND GND GND GND GND GND GND GND GND GND GND GND 
 		+	GND GND GND GND GND GND GND GND GND GND GND GND GND GND GND GND 
 +S15  S14  S13  S12  S11  S10  S9  S8  S7  S6  S5  S4  S3  S2  S1  S0
 +CI0  CO15 BKADDER

Vin1 CI0 	GND PULSE 0 3.3 TD TR TF PW PER


.option captab
.tran   0.01n   TEND

*****************************************

.end