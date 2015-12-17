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
.param TD=10ns
.param TR=1ns
.param TF=1ns
.param PW=50ns
.param PER=100ns
.param TEND=26us

***********includes**********************
.include 'net.sp'
vbias vdd gnd 3.3
cload OUT gnd 1e-12

*.subckt  BKADDER  A15  A14  A13  A12  A11  A10  A9  A8  A7  A6  A5  A4  A3  A2  A1  A0
* +B15  B14  B13  B12  B11  B10  B9  B8  B7  B6  B5  B4  B3  B2  B1  B0
* +S15  S14  S13  S12  S11  S10  S9  S8  S7  S6  S5  S4  S3  S2  S1  S0
* +CI0  CO15

*****************
*test2: 0000 0000 0000 A3 A2 A1 A0 + 0000 0000 0000 B3 B2 B1 B0 + 0->1 (Ci0)
XBKADDER 	GND GND GND GND GND GND GND GND GND GND GND GND A3 A2 A1 A0
 		+	GND GND GND GND GND GND GND GND GND GND GND GND B3 B2 B1 B0
 +S15  S14  S13  S12  S11  S10  S9  S8  S7  S6  S5  S4  S3  S2  S1  S0
 +CI0  CO15 BKADDER

Vin1 A0 GND PULSE 3.3 0 TD TR TF PW PER
Vin2 A1 GND PULSE 3.3 0 TD TR TF '2*PW' '2*PER'
Vin3 A2 GND PULSE 3.3 0 TD TR TF '4*PW' '4*PER'
Vin4 A3 GND PULSE 3.3 0 TD TR TF '8*PW' '8*PER'
Vin5 B0 GND PULSE 3.3 0 TD TR TF '16*PW' '16*PER'
Vin6 B1 GND PULSE 3.3 0 TD TR TF '32*PW' '32*PER'
Vin7 B2 GND PULSE 3.3 0 TD TR TF '64*PW' '64*PER'
Vin8 B3 GND PULSE 3.3 0 TD TR TF '128*PW' '128*PER'
Vin9 CI0 GND PULSE 3.3 0 TD TR TF '256*PW' '256*PER'
****************

.option captab
.tran   0.01n   TEND

*****************************************

.end