#!../../bin/linux-x86/psc

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
epicsEnvSet("EPICS_CA_ADDR_LIST","10.0.153.255")
epicsEnvSet("IOCNAME", "ps-br-dcseptum-ng")

#epicsThreadSleep 5

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/psc.dbd",0,0)
psc_registerRecordDeviceDriver(pdbbase)

## Load record instances


dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC16")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC16")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC16, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:00_Raw-I,  OUTPUT=BR{PSC16}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:01_Raw-I,  OUTPUT=BR{PSC16}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:02_Raw-I,  OUTPUT=BR{PSC16}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:03_Raw-I,  OUTPUT=BR{PSC16}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:04_Raw-I,  OUTPUT=BR{PSC16}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:05_Raw-I,  OUTPUT=BR{PSC16}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:06_Raw-I,  OUTPUT=BR{PSC16}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:07_Raw-I,  OUTPUT=BR{PSC16}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:08_Raw-I,  OUTPUT=BR{PSC16}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:09_Raw-I,  OUTPUT=BR{PSC16}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:10_Raw-I,  OUTPUT=BR{PSC16}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:11_Raw-I,  OUTPUT=BR{PSC16}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:12_Raw-I,  OUTPUT=BR{PSC16}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:13_Raw-I,  OUTPUT=BR{PSC16}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:14_Raw-I,  OUTPUT=BR{PSC16}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:15_Raw-I,  OUTPUT=BR{PSC16}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:16_Raw-I,  OUTPUT=BR{PSC16}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:17_Raw-I,  OUTPUT=BR{PSC16}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC16}ADC10k:0_Raw-I,  OUTPUT=BR{PSC16}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC16}ADC10k:1_Raw-I,  OUTPUT=BR{PSC16}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC16}ADC10k:0-I, INPUT2=BR{PSC16}ADC10k:1-I, OUTPUT=BR{PSC16}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC16}ADC10k:0_Raw-I,  OUTPUT=BR{PSC16}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC16}ADC10k:1_Raw-I,  OUTPUT=BR{PSC16}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC16, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}SMD_Delta-SP, DELTA_STEPS=BR-PS{}SMD_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC16}DAC:0-SP,         OUTPUT=BR{PSC16}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC16}DAC:0_Raw-SP,     OUTPUT=BR{PSC16}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC16}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC16}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC16, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}SMD_Delta-SP, DELTA_STEPS=BR-PS{}SMD_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC16}DAC:1-SP,         OUTPUT=BR{PSC16}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC16}DAC:1_Raw-SP,     OUTPUT=BR{PSC16}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC16}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC16}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

# BR-PS{PS:SMD1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:SMD1}I-SP,        OUTPUT=BR{PSC16}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:00-I,          OUTPUT=BR-PS{PS:SMD1}I:DAC_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:01-I,          OUTPUT=BR-PS{PS:SMD1}I_Raw-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:16-I,          OUTPUT=BR-PS{PS:SMD1}I:DCCT2_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:03-I,          OUTPUT=BR-PS{PS:SMD1}E:OutPos_Raw-I,  WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC16}ADC:04-I,          OUTPUT=BR-PS{PS:SMD1}E:OutNeg_Raw-I,  WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:SMD1}Cmd:RstErr-Cmd,   OUTPUT=BR{PSC16}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:SMD1}Cmd:PwrOn-Cmd,    OUTPUT=BR{PSC16}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:SMD1}Cmd:PwrOff-Cmd,   OUTPUT=BR{PSC16}DO:2-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC16}DI:00-Sts,         OUTPUT=BR-PS{PS:SMD1}Flt:Inverter-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC16}DI:01-Sts,         OUTPUT=BR-PS{PS:SMD1}Sts:PwrOn-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC16}DI:02-Sts,         OUTPUT=BR-PS{PS:SMD1}Flt:PSovrpwr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC16}DI:03-Sts,         OUTPUT=BR-PS{PS:SMD1}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC16}DI:04-Sts,         OUTPUT=BR-PS{PS:SMD1}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC16}DI:05-Sts,         OUTPUT=BR-PS{PS:SMD1}Flt:LoadOvrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC16}DI:06-Sts,         OUTPUT=BR-PS{PS:SMD1}Flt:Water-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:SMD1}I-SP, OUTPUT=BR-PS{PS:SMD1}I_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:SMD1}I_Raw-SP-1k,   OUTPUT=BR-PS{PS:SMD1}I-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I-SP-1k,       INDEX=BR-PS{PS:SMD1}I-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:SMD1}I-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I-SP-1k,       INDEX=BR-PS{PS:SMD1}I-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:SMD1}I-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I-SP-1k,       INDEX=BR-PS{PS:SMD1}I-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:SMD1}I-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:SMD1}I:DAC_Raw-I,   OUTPUT=BR-PS{PS:SMD1}I:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I:DAC-I,       INDEX=BR-PS{PS:SMD1}I:DAC-I-Slicer-Idx1, OUTPUT=BR-PS{PS:SMD1}I:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I:DAC-I,       INDEX=BR-PS{PS:SMD1}I:DAC-I-Slicer-Idx2, OUTPUT=BR-PS{PS:SMD1}I:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I:DAC-I,       INDEX=BR-PS{PS:SMD1}I:DAC-I-Slicer-Idx3, OUTPUT=BR-PS{PS:SMD1}I:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:SMD1}I_Raw-I,   OUTPUT=BR-PS{PS:SMD1}I-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I-I,       INDEX=BR-PS{PS:SMD1}I-I-Slicer-Idx1, OUTPUT=BR-PS{PS:SMD1}I-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I-I,       INDEX=BR-PS{PS:SMD1}I-I-Slicer-Idx2, OUTPUT=BR-PS{PS:SMD1}I-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I-I,       INDEX=BR-PS{PS:SMD1}I-I-Slicer-Idx3, OUTPUT=BR-PS{PS:SMD1}I-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:SMD1}I:DCCT2_Raw-I, OUTPUT=BR-PS{PS:SMD1}I:DCCT2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I:DCCT2-I,     INDEX=BR-PS{PS:SMD1}I:DCCT2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:SMD1}I:DCCT2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I:DCCT2-I,     INDEX=BR-PS{PS:SMD1}I:DCCT2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:SMD1}I:DCCT2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}I:DCCT2-I,     INDEX=BR-PS{PS:SMD1}I:DCCT2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:SMD1}I:DCCT2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:SMD1}E:OutPos_Raw-I,    OUTPUT=BR-PS{PS:SMD1}E:OutPos-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}E:OutPos-I,       INDEX=BR-PS{PS:SMD1}E:OutPos-I-Slicer-Idx1, OUTPUT=BR-PS{PS:SMD1}E:OutPos-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}E:OutPos-I,       INDEX=BR-PS{PS:SMD1}E:OutPos-I-Slicer-Idx2, OUTPUT=BR-PS{PS:SMD1}E:OutPos-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}E:OutPos-I,       INDEX=BR-PS{PS:SMD1}E:OutPos-I-Slicer-Idx3, OUTPUT=BR-PS{PS:SMD1}E:OutPos-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:SMD1}E:OutNeg_Raw-I,    OUTPUT=BR-PS{PS:SMD1}E:OutNeg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}E:OutNeg-I,       INDEX=BR-PS{PS:SMD1}E:OutNeg-I-Slicer-Idx1, OUTPUT=BR-PS{PS:SMD1}E:OutNeg-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}E:OutNeg-I,       INDEX=BR-PS{PS:SMD1}E:OutNeg-I-Slicer-Idx2, OUTPUT=BR-PS{PS:SMD1}E:OutNeg-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:SMD1}E:OutNeg-I,       INDEX=BR-PS{PS:SMD1}E:OutNeg-I-Slicer-Idx3, OUTPUT=BR-PS{PS:SMD1}E:OutNeg-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:SMD1}I-SP, CH_REF=BR-PS{PS:SMD1}I-SP_Ref, CH_TOL=BR-PS{PS:SMD1}I_SP_Tol-SP, CH_ARCH=BR-PS{PS:SMD1}I_SP_Arch-I, CH_DIFFREF=BR-PS{PS:SMD1}I_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:SMD1}I_SP_DiffArch-I, CH_FLG=BR-PS{PS:SMD1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}I_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:SMD1}I_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}I-SP, CH_REF=BR-PS{PS:SMD1}I-SP_Ref, CH_DIFFREF=BR-PS{PS:SMD1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}I_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}I-SP, CH_REF=BR-PS{PS:SMD1}I-SP_Ref, CH_DIFFREF=BR-PS{PS:SMD1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}I_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:SMD1}I:DAC-I, CH_REF=BR-PS{PS:SMD1}I:DAC-I_Ref, CH_TOL=BR-PS{PS:SMD1}I:DAC_I_Tol-SP,  CH_ARCH=BR-PS{PS:SMD1}I:DAC_I_Arch-I, CH_DIFFREF=BR-PS{PS:SMD1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:SMD1}I:DAC_I_DiffArch-I, CH_FLG=BR-PS{PS:SMD1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}I:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:SMD1}I:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}I:DAC-I, CH_REF=BR-PS{PS:SMD1}I:DAC-I_Ref, CH_DIFFREF=BR-PS{PS:SMD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}I:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}I:DAC-I, CH_REF=BR-PS{PS:SMD1}I-SP-1k, CH_DIFFREF=BR-PS{PS:SMD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}I:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:SMD1}I-I, CH_REF=BR-PS{PS:SMD1}I-I_Ref, CH_TOL=BR-PS{PS:SMD1}I_I_Tol-SP, CH_ARCH=BR-PS{PS:SMD1}I_I_Arch-I, CH_DIFFREF=BR-PS{PS:SMD1}I_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:SMD1}I_I_DiffArch-I, CH_FLG=BR-PS{PS:SMD1}I_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}I_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:SMD1}I_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}I-I, CH_REF=BR-PS{PS:SMD1}I-I_Ref, CH_DIFFREF=BR-PS{PS:SMD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}I_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}I-I, CH_REF=BR-PS{PS:SMD1}I-SP-1k, CH_DIFFREF=BR-PS{PS:SMD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}I_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:SMD1}I:DCCT2-I, CH_REF=BR-PS{PS:SMD1}I:DCCT2-I_Ref, CH_TOL=BR-PS{PS:SMD1}I:DCCT2_I_Tol-SP, CH_ARCH=BR-PS{PS:SMD1}I:DCCT2_I_Arch-I, CH_DIFFREF=BR-PS{PS:SMD1}I:DCCT2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:SMD1}I:DCCT2_I_DiffArch-I, CH_FLG=BR-PS{PS:SMD1}I:DCCT2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}I:DCCT2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:SMD1}I:DCCT2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}I:DCCT2-I, CH_REF=BR-PS{PS:SMD1}I:DCCT2-I_Ref, CH_DIFFREF=BR-PS{PS:SMD1}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}I:DCCT2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}I:DCCT2-I, CH_REF=BR-PS{PS:SMD1}I-SP-1k, CH_DIFFREF=BR-PS{PS:SMD1}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}I:DCCT2_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:SMD1}E:OutPos-I, CH_REF=BR-PS{PS:SMD1}E:OutPos-I_Ref, CH_TOL=BR-PS{PS:SMD1}E:OutPos_I_Tol-SP, CH_ARCH=BR-PS{PS:SMD1}E:OutPos_I_Arch-I, CH_DIFFREF=BR-PS{PS:SMD1}E:OutPos_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:SMD1}E:OutPos_I_DiffArch-I, CH_FLG=BR-PS{PS:SMD1}E:OutPos_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}E:OutPos_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:SMD1}E:OutPos_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}E:OutPos-I, CH_REF=BR-PS{PS:SMD1}E:OutPos-I_Ref, CH_DIFFREF=BR-PS{PS:SMD1}E:OutPos_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}E:OutPos_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}E:OutPos-I, CH_REF=BR-PS{PS:SMD1}E:OutPos-I_Ref, CH_DIFFREF=BR-PS{PS:SMD1}E:OutPos_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}E:OutPos_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:SMD1}E:OutNeg-I, CH_REF=BR-PS{PS:SMD1}E:OutNeg-I_Ref, CH_TOL=BR-PS{PS:SMD1}E:OutNeg_I_Tol-SP, CH_ARCH=BR-PS{PS:SMD1}E:OutNeg_I_Arch-I, CH_DIFFREF=BR-PS{PS:SMD1}E:OutNeg_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:SMD1}E:OutNeg_I_DiffArch-I, CH_FLG=BR-PS{PS:SMD1}E:OutNeg_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}E:OutNeg_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:SMD1}E:OutNeg_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}E:OutNeg-I, CH_REF=BR-PS{PS:SMD1}E:OutNeg-I_Ref, CH_DIFFREF=BR-PS{PS:SMD1}E:OutNeg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}E:OutNeg_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:SMD1}E:OutNeg-I, CH_REF=BR-PS{PS:SMD1}E:OutNeg-I_Ref, CH_DIFFREF=BR-PS{PS:SMD1}E:OutNeg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}E:OutNeg_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR-PS{PS:SMD1}Cmd:RstErr_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:SMD1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:SMD1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR-PS{PS:SMD1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:PwrOff-Cmd_Ref, CH_ARCH=BR-PS{PS:SMD1}Cmd:PwrOff_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOff_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Cmd:PwrOff_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:PwrOff-Cmd_Ref, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOff_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOff_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:SMD1}Cmd:PwrOff-Cmd_Ref, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOff_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Cmd:PwrOff_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Flt:Inverter-Sts, CH_REF=BR-PS{PS:SMD1}Flt:Inverter-Sts_Ref, CH_ARCH=BR-PS{PS:SMD1}Flt:Inverter_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Flt:Inverter_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Flt:Inverter_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:Inverter-Sts, CH_REF=BR-PS{PS:SMD1}Flt:Inverter-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:Inverter_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:Inverter_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:Inverter-Sts, CH_REF=BR-PS{PS:SMD1}Flt:Inverter-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:Inverter_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:Inverter_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:SMD1}Sts:PwrOn-Sts_Ref, CH_ARCH=BR-PS{PS:SMD1}Sts:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:SMD1}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:SMD1}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Flt:PSovrpwr-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrpwr-Sts_Ref, CH_ARCH=BR-PS{PS:SMD1}Flt:PSovrpwr_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrpwr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Flt:PSovrpwr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:PSovrpwr-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrpwr-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrpwr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrpwr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:PSovrpwr-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrpwr-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrpwr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrpwr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:SMD1}Flt:PSovrheat_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR-PS{PS:SMD1}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:SMD1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Flt:LoadOvrheat-Sts, CH_REF=BR-PS{PS:SMD1}Flt:LoadOvrheat-Sts_Ref, CH_ARCH=BR-PS{PS:SMD1}Flt:LoadOvrheat_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Flt:LoadOvrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Flt:LoadOvrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:LoadOvrheat-Sts, CH_REF=BR-PS{PS:SMD1}Flt:LoadOvrheat-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:LoadOvrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:LoadOvrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:LoadOvrheat-Sts, CH_REF=BR-PS{PS:SMD1}Flt:LoadOvrheat-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:LoadOvrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:LoadOvrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:SMD1}Flt:Water-Sts, CH_REF=BR-PS{PS:SMD1}Flt:Water-Sts_Ref, CH_ARCH=BR-PS{PS:SMD1}Flt:Water_Arch-Sts, CH_FLG=BR-PS{PS:SMD1}Flt:Water_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:SMD1}Flt:Water_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:Water-Sts, CH_REF=BR-PS{PS:SMD1}Flt:Water-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:Water_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:Water_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:SMD1}Flt:Water-Sts, CH_REF=BR-PS{PS:SMD1}Flt:Water-Sts_Ref, CH_FLG=BR-PS{PS:SMD1}Flt:Water_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:SMD1}Flt:Water_MonitFlg-Sts, MODE=1, ENABLED=0")


var(PSCDebug, 1)
#with debug message: var(PSCDebug, 2)

#Tx socket
createPSC("TxPSC16", "br-psc16", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC16", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC16", "br-psc16", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC16", 80, 128)

### Misc stuff ###
epicsEnvSet("LOCATION","740 ISB RGB 1")
dbLoadRecords("db/iocAdminSoft.db", "IOC=BR-CT{IOC:${IOCNAME}}")
asSetFilename("/cf-update/acf/default.acf")

### Save/Restore ###
dbLoadRecords("db/save_restoreStatus.db", "P=BR-CT{IOC:${IOCNAME}}")
save_restoreSet_status_prefix("BR-CT{IOC:${IOCNAME}}")
set_savefile_path("${TOP}/../${IOCNAME}","/as/save")
set_requestfile_path("${TOP}/../${IOCNAME}","/as/req")
set_pass0_restoreFile("${IOCNAME}.sav")
set_pass1_restoreFile("${IOCNAME}_waveforms.sav")

### Start IOC ###
cd ${TOP}/iocBoot/${IOC}
iocInit()

### caPutLog ###
caPutLogInit("ioclog.cs.nsls2.local:7004", 1)

### Channel Finder
dbl > ${TOP}/../${IOCNAME}/records.dbl
system "cp ${TOP}/../${IOCNAME}/records.dbl /cf-update/${HOSTNAME}.${IOCNAME}.dbl"

### Save/Restore ###
makeAutosaveFileFromDbInfo("${TOP}/../${IOCNAME}/as/req/${IOCNAME}.req", "autosaveFields_pass0")
makeAutosaveFileFromDbInfo("${TOP}/../${IOCNAME}/as/req/${IOCNAME}_waveforms.req", "autosaveFields_pass1")

create_monitor_set("${IOCNAME}.req", 5 , "")
create_monitor_set("${IOCNAME}_waveforms.req", 30 , "")

