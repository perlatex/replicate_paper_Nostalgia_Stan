﻿* Encoding: UTF-8.

RELIABILITY
  /VARIABLES=Skep1 Skep2 Skep3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

COMPUTE Skepticism=(Skep1 + Skep2 + Skep3) / 3.
EXECUTE.

COMPUTE SupportAI=(support_AI1 + support_AI2) /2. 
EXECUTE.

COMPUTE Support5G=(support_5G1 + support_5G2) / 2.
EXECUTE.

COMPUTE Lnword=LN(word+1).
EXECUTE.

COMPUTE Lntime=LN(time+1).
EXECUTE.

UNIANOVA Skepticism BY Mskep
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Mskep) 
  /PRINT=OPOWER ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=Mskep.

GLM SupportAI Support5G BY Mskep
  /WSFACTOR=Target 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Mskep) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Target) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Mskep*Target) 
  /PRINT=DESCRIPTIVE ETASQ OPOWER 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Target 
  /DESIGN=Mskep.

UNIANOVA Lntime BY Mskep
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Mskep) 
  /PRINT=OPOWER ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=Mskep.

UNIANOVA Lnword BY Mskep
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Mskep) 
  /PRINT=OPOWER ETASQ DESCRIPTIVE
  /CRITERIA=ALPHA(.05)
  /DESIGN=Mskep.