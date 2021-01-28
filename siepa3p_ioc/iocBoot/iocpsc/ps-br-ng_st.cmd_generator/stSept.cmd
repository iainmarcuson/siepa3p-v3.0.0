#!../../bin/linux-x86/psc

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
epicsEnvSet("EPICS_CA_ADDR_LIST","10.0.153.255")
epicsEnvSet("IOCNAME", "ps-br-septum-ng")

#epicsThreadSleep 5

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/psc.dbd",0,0)
psc_registerRecordDeviceDriver(pdbbase)

## Load record instances


dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC13")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC13")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC13, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:00_Raw-I,  OUTPUT=BR{PSC13}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:01_Raw-I,  OUTPUT=BR{PSC13}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:02_Raw-I,  OUTPUT=BR{PSC13}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:03_Raw-I,  OUTPUT=BR{PSC13}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:04_Raw-I,  OUTPUT=BR{PSC13}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:05_Raw-I,  OUTPUT=BR{PSC13}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:06_Raw-I,  OUTPUT=BR{PSC13}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:07_Raw-I,  OUTPUT=BR{PSC13}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:08_Raw-I,  OUTPUT=BR{PSC13}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:09_Raw-I,  OUTPUT=BR{PSC13}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:10_Raw-I,  OUTPUT=BR{PSC13}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:11_Raw-I,  OUTPUT=BR{PSC13}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:12_Raw-I,  OUTPUT=BR{PSC13}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:13_Raw-I,  OUTPUT=BR{PSC13}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:14_Raw-I,  OUTPUT=BR{PSC13}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:15_Raw-I,  OUTPUT=BR{PSC13}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:16_Raw-I,  OUTPUT=BR{PSC13}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:17_Raw-I,  OUTPUT=BR{PSC13}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC13}ADC10k:0_Raw-I,  OUTPUT=BR{PSC13}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC13}ADC10k:1_Raw-I,  OUTPUT=BR{PSC13}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC13}ADC10k:0-I, INPUT2=BR{PSC13}ADC10k:1-I, OUTPUT=BR{PSC13}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC13}ADC10k:0_Raw-I,  OUTPUT=BR{PSC13}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC13}ADC10k:1_Raw-I,  OUTPUT=BR{PSC13}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC13, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}SMP_Delta-SP, DELTA_STEPS=BR-PS{}SMP_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC13}DAC:0-SP,         OUTPUT=BR{PSC13}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC13}DAC:0_Raw-SP,     OUTPUT=BR{PSC13}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC13}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC13}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC13, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}SMP_Delta-SP, DELTA_STEPS=BR-PS{}SMP_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC13}DAC:1-SP,         OUTPUT=BR{PSC13}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC13}DAC:1_Raw-SP,     OUTPUT=BR{PSC13}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC13}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC13}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC14")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC14")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC14, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:00_Raw-I,  OUTPUT=BR{PSC14}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:01_Raw-I,  OUTPUT=BR{PSC14}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:02_Raw-I,  OUTPUT=BR{PSC14}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:03_Raw-I,  OUTPUT=BR{PSC14}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:04_Raw-I,  OUTPUT=BR{PSC14}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:05_Raw-I,  OUTPUT=BR{PSC14}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:06_Raw-I,  OUTPUT=BR{PSC14}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:07_Raw-I,  OUTPUT=BR{PSC14}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:08_Raw-I,  OUTPUT=BR{PSC14}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:09_Raw-I,  OUTPUT=BR{PSC14}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:10_Raw-I,  OUTPUT=BR{PSC14}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:11_Raw-I,  OUTPUT=BR{PSC14}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:12_Raw-I,  OUTPUT=BR{PSC14}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:13_Raw-I,  OUTPUT=BR{PSC14}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:14_Raw-I,  OUTPUT=BR{PSC14}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:15_Raw-I,  OUTPUT=BR{PSC14}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:16_Raw-I,  OUTPUT=BR{PSC14}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:17_Raw-I,  OUTPUT=BR{PSC14}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC14}ADC10k:0_Raw-I,  OUTPUT=BR{PSC14}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC14}ADC10k:1_Raw-I,  OUTPUT=BR{PSC14}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC14}ADC10k:0-I, INPUT2=BR{PSC14}ADC10k:1-I, OUTPUT=BR{PSC14}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC14}ADC10k:0_Raw-I,  OUTPUT=BR{PSC14}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC14}ADC10k:1_Raw-I,  OUTPUT=BR{PSC14}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC14, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}SMP_Delta-SP, DELTA_STEPS=BR-PS{}SMP_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC14}DAC:0-SP,         OUTPUT=BR{PSC14}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC14}DAC:0_Raw-SP,     OUTPUT=BR{PSC14}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC14}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC14}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC14, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}SMP_Delta-SP, DELTA_STEPS=BR-PS{}SMP_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC14}DAC:1-SP,         OUTPUT=BR{PSC14}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC14}DAC:1_Raw-SP,     OUTPUT=BR{PSC14}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC14}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC14}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC15")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC15")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC15, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:00_Raw-I,  OUTPUT=BR{PSC15}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:01_Raw-I,  OUTPUT=BR{PSC15}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:02_Raw-I,  OUTPUT=BR{PSC15}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:03_Raw-I,  OUTPUT=BR{PSC15}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:04_Raw-I,  OUTPUT=BR{PSC15}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:05_Raw-I,  OUTPUT=BR{PSC15}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:06_Raw-I,  OUTPUT=BR{PSC15}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:07_Raw-I,  OUTPUT=BR{PSC15}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:08_Raw-I,  OUTPUT=BR{PSC15}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:09_Raw-I,  OUTPUT=BR{PSC15}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:10_Raw-I,  OUTPUT=BR{PSC15}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:11_Raw-I,  OUTPUT=BR{PSC15}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:12_Raw-I,  OUTPUT=BR{PSC15}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:13_Raw-I,  OUTPUT=BR{PSC15}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:14_Raw-I,  OUTPUT=BR{PSC15}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:15_Raw-I,  OUTPUT=BR{PSC15}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:16_Raw-I,  OUTPUT=BR{PSC15}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:17_Raw-I,  OUTPUT=BR{PSC15}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC15}ADC10k:0_Raw-I,  OUTPUT=BR{PSC15}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC15}ADC10k:1_Raw-I,  OUTPUT=BR{PSC15}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC15}ADC10k:0-I, INPUT2=BR{PSC15}ADC10k:1-I, OUTPUT=BR{PSC15}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC15}ADC10k:0_Raw-I,  OUTPUT=BR{PSC15}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC15}ADC10k:1_Raw-I,  OUTPUT=BR{PSC15}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC15, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}SMP_Delta-SP, DELTA_STEPS=BR-PS{}SMP_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC15}DAC:0-SP,         OUTPUT=BR{PSC15}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC15}DAC:0_Raw-SP,     OUTPUT=BR{PSC15}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC15}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC15}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC15, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}SMP_Delta-SP, DELTA_STEPS=BR-PS{}SMP_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC15}DAC:1-SP,         OUTPUT=BR{PSC15}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC15}DAC:1_Raw-SP,     OUTPUT=BR{PSC15}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC15}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC15}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

# BR:IS-PS{PS:SMP1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:IS-PS{PS:SMP1}E:Bank-SP,                             OUTPUT=BR{PSC13}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:00-I,          OUTPUT=BR:IS-PS{PS:SMP1}E:DAC_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:01-I,          OUTPUT=BR:IS-PS{PS:SMP1}E:Bank_Raw-I,    WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:02-I,          OUTPUT=BR:IS-PS{PS:SMP1}I:Charg_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:03-I,          OUTPUT=BR:IS-PS{PS:SMP1}E:Charg_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC13}ADC:04-I,          OUTPUT=BR:IS-PS{PS:SMP1}E:UVSet_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:SMP1}Cmd:RstErr-Cmd,   OUTPUT=BR{PSC13}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:SMP1}Cmd:PwrOn-Cmd,    OUTPUT=BR{PSC13}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:00-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Sts:PwrOn-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:01-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:02-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:03-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:04-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Flt:Driver-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:07-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Flt:Bank-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:08-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Sts:PulserDoor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:09-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:10-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Flt:CtrlUnit-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC13}DI:11-Sts,         OUTPUT=BR:IS-PS{PS:SMP1}Sts:PSblock-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:IS-PS{PS:SMP1}E:Bank-SP, OUTPUT=BR:IS-PS{PS:SMP1}E:Bank_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Bank_Raw-SP-1k,   OUTPUT=BR:IS-PS{PS:SMP1}E:Bank-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Bank-SP-1k,       INDEX=BR:IS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Bank-SP-1k,       INDEX=BR:IS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Bank-SP-1k,       INDEX=BR:IS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:SMP1}E:DAC_Raw-I,        OUTPUT=BR:IS-PS{PS:SMP1}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:DAC-I,            INDEX=BR:IS-PS{PS:SMP1}E:DAC-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:SMP1}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:DAC-I,            INDEX=BR:IS-PS{PS:SMP1}E:DAC-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:SMP1}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:DAC-I,            INDEX=BR:IS-PS{PS:SMP1}E:DAC-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:SMP1}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Bank_Raw-I,       OUTPUT=BR:IS-PS{PS:SMP1}E:Bank-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Bank-I,           INDEX=BR:IS-PS{PS:SMP1}E:Bank-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:SMP1}E:Bank-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Bank-I,           INDEX=BR:IS-PS{PS:SMP1}E:Bank-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:SMP1}E:Bank-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Bank-I,           INDEX=BR:IS-PS{PS:SMP1}E:Bank-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:SMP1}E:Bank-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:SMP1}I:Charg_Raw-I,      OUTPUT=BR:IS-PS{PS:SMP1}I:Charg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}I:Charg-I,          INDEX=BR:IS-PS{PS:SMP1}I:Charg-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:SMP1}I:Charg-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}I:Charg-I,          INDEX=BR:IS-PS{PS:SMP1}I:Charg-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:SMP1}I:Charg-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}I:Charg-I,          INDEX=BR:IS-PS{PS:SMP1}I:Charg-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:SMP1}I:Charg-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Charg_Raw-I,      OUTPUT=BR:IS-PS{PS:SMP1}E:Charg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Charg-I,          INDEX=BR:IS-PS{PS:SMP1}E:Charg-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:SMP1}E:Charg-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Charg-I,          INDEX=BR:IS-PS{PS:SMP1}E:Charg-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:SMP1}E:Charg-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:Charg-I,          INDEX=BR:IS-PS{PS:SMP1}E:Charg-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:SMP1}E:Charg-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:SMP1}E:UVSet_Raw-I,      OUTPUT=BR:IS-PS{PS:SMP1}E:UVSet-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:UVSet-I,          INDEX=BR:IS-PS{PS:SMP1}E:UVSet-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:SMP1}E:UVSet-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:UVSet-I,          INDEX=BR:IS-PS{PS:SMP1}E:UVSet-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:SMP1}E:UVSet-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:SMP1}E:UVSet-I,          INDEX=BR:IS-PS{PS:SMP1}E:UVSet-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:SMP1}E:UVSet-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:SMP1}E:Bank-SP, CH_REF=BR:IS-PS{PS:SMP1}E:Bank-SP_Ref, CH_TOL=BR:IS-PS{PS:SMP1}E:Bank_SP_Tol-SP, CH_ARCH=BR:IS-PS{PS:SMP1}E:Bank_SP_Arch-I, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Bank_SP_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:SMP1}E:Bank_SP_DiffArch-I, CH_FLG=BR:IS-PS{PS:SMP1}E:Bank_SP_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}E:Bank_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:SMP1}E:Bank_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:Bank-SP, CH_REF=BR:IS-PS{PS:SMP1}E:Bank-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Bank_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:Bank_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:Bank-SP, CH_REF=BR:IS-PS{PS:SMP1}E:Bank-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Bank_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:Bank_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:SMP1}E:DAC-I, CH_REF=BR:IS-PS{PS:SMP1}E:DAC-I_Ref, CH_TOL=BR:IS-PS{PS:SMP1}E:DAC_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:SMP1}E:DAC_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:SMP1}E:DAC_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:SMP1}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:SMP1}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:DAC-I, CH_REF=BR:IS-PS{PS:SMP1}E:DAC-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:DAC-I, CH_REF=BR:IS-PS{PS:SMP1}E:Bank-SP-1k, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:SMP1}E:Bank-I, CH_REF=BR:IS-PS{PS:SMP1}E:Bank-I_Ref, CH_TOL=BR:IS-PS{PS:SMP1}E:Bank_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:SMP1}E:Bank_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Bank_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:SMP1}E:Bank_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:SMP1}E:Bank_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}E:Bank_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:SMP1}E:Bank_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:Bank-I, CH_REF=BR:IS-PS{PS:SMP1}E:Bank-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Bank_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:Bank_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:Bank-I, CH_REF=BR:IS-PS{PS:SMP1}E:Bank-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Bank_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:Bank_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:SMP1}I:Charg-I, CH_REF=BR:IS-PS{PS:SMP1}I:Charg-I_Ref, CH_TOL=BR:IS-PS{PS:SMP1}I:Charg_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:SMP1}I:Charg_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:SMP1}I:Charg_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:SMP1}I:Charg_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:SMP1}I:Charg_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}I:Charg_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:SMP1}I:Charg_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}I:Charg-I, CH_REF=BR:IS-PS{PS:SMP1}I:Charg-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}I:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}I:Charg_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}I:Charg-I, CH_REF=BR:IS-PS{PS:SMP1}I:Charg-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}I:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}I:Charg_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:SMP1}E:Charg-I, CH_REF=BR:IS-PS{PS:SMP1}E:Charg-I_Ref, CH_TOL=BR:IS-PS{PS:SMP1}E:Charg_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:SMP1}E:Charg_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Charg_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:SMP1}E:Charg_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:SMP1}E:Charg_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}E:Charg_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:SMP1}E:Charg_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:Charg-I, CH_REF=BR:IS-PS{PS:SMP1}E:Charg-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:Charg_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:Charg-I, CH_REF=BR:IS-PS{PS:SMP1}E:Charg-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:Charg_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:SMP1}E:UVSet-I, CH_REF=BR:IS-PS{PS:SMP1}E:UVSet-I_Ref, CH_TOL=BR:IS-PS{PS:SMP1}E:UVSet_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:SMP1}E:UVSet_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:UVSet_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:SMP1}E:UVSet_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:SMP1}E:UVSet_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}E:UVSet_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:SMP1}E:UVSet_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:UVSet-I, CH_REF=BR:IS-PS{PS:SMP1}E:UVSet-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:UVSet_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:UVSet_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:SMP1}E:UVSet-I, CH_REF=BR:IS-PS{PS:SMP1}E:UVSet-I_Ref, CH_DIFFREF=BR:IS-PS{PS:SMP1}E:UVSet_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}E:UVSet_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:SMP1}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Cmd:RstErr_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:SMP1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:SMP1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:SMP1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:SMP1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:SMP1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Sts:PwrOn-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PwrOn-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Sts:PwrOn_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Sts:PwrOn-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PwrOn-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Sts:PwrOn-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PwrOn-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Flt:PSovrcurr-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:PSovrcurr-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:PSovrcurr-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Flt:PSovrheat-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Flt:PSovrheat_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:PSovrheat-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:PSovrheat-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Flt:Driver-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:Driver-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Flt:Driver_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Flt:Driver_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:Driver-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:Driver-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:Driver-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:Driver-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Flt:Bank-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:Bank-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Flt:Bank_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Flt:Bank_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:Bank-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:Bank-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:Bank-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:Bank-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Sts:PulserDoor-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PulserDoor-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Sts:PulserDoor_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Sts:PulserDoor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Sts:PulserDoor-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PulserDoor-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Sts:PulserDoor-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PulserDoor-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Sts:EmergButton_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Flt:CtrlUnit-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:CtrlUnit-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Flt:CtrlUnit_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Flt:CtrlUnit_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:CtrlUnit-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:CtrlUnit-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Flt:CtrlUnit-Sts, CH_REF=BR:IS-PS{PS:SMP1}Flt:CtrlUnit-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:SMP1}Sts:PSblock-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PSblock-Sts_Ref, CH_ARCH=BR:IS-PS{PS:SMP1}Sts:PSblock_Arch-Sts, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:SMP1}Sts:PSblock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Sts:PSblock-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PSblock-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:SMP1}Sts:PSblock-Sts, CH_REF=BR:IS-PS{PS:SMP1}Sts:PSblock-Sts_Ref, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR:XS-PS{PS:SMP1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:XS-PS{PS:SMP1}E:Bank-SP,                             OUTPUT=BR{PSC14}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:00-I,          OUTPUT=BR:XS-PS{PS:SMP1}E:DAC_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:01-I,          OUTPUT=BR:XS-PS{PS:SMP1}E:Bank_Raw-I,    WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:02-I,          OUTPUT=BR:XS-PS{PS:SMP1}I:Charg_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:03-I,          OUTPUT=BR:XS-PS{PS:SMP1}E:Charg_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC14}ADC:04-I,          OUTPUT=BR:XS-PS{PS:SMP1}E:UVSet_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:SMP1}Cmd:RstErr-Cmd,   OUTPUT=BR{PSC14}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:SMP1}Cmd:PwrOn-Cmd,    OUTPUT=BR{PSC14}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:00-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Sts:PwrOn-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:01-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:02-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:03-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:04-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Flt:Driver-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:07-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Flt:Bank-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:08-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Sts:PulserDoor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:09-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:10-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Flt:CtrlUnit-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC14}DI:11-Sts,         OUTPUT=BR:XS-PS{PS:SMP1}Sts:PSblock-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:XS-PS{PS:SMP1}E:Bank-SP, OUTPUT=BR:XS-PS{PS:SMP1}E:Bank_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Bank_Raw-SP-1k,   OUTPUT=BR:XS-PS{PS:SMP1}E:Bank-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Bank-SP-1k,       INDEX=BR:XS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Bank-SP-1k,       INDEX=BR:XS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Bank-SP-1k,       INDEX=BR:XS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:SMP1}E:Bank-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:SMP1}E:DAC_Raw-I,        OUTPUT=BR:XS-PS{PS:SMP1}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:DAC-I,            INDEX=BR:XS-PS{PS:SMP1}E:DAC-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:SMP1}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:DAC-I,            INDEX=BR:XS-PS{PS:SMP1}E:DAC-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:SMP1}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:DAC-I,            INDEX=BR:XS-PS{PS:SMP1}E:DAC-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:SMP1}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Bank_Raw-I,       OUTPUT=BR:XS-PS{PS:SMP1}E:Bank-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Bank-I,           INDEX=BR:XS-PS{PS:SMP1}E:Bank-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:SMP1}E:Bank-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Bank-I,           INDEX=BR:XS-PS{PS:SMP1}E:Bank-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:SMP1}E:Bank-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Bank-I,           INDEX=BR:XS-PS{PS:SMP1}E:Bank-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:SMP1}E:Bank-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:SMP1}I:Charg_Raw-I,      OUTPUT=BR:XS-PS{PS:SMP1}I:Charg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}I:Charg-I,          INDEX=BR:XS-PS{PS:SMP1}I:Charg-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:SMP1}I:Charg-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}I:Charg-I,          INDEX=BR:XS-PS{PS:SMP1}I:Charg-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:SMP1}I:Charg-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}I:Charg-I,          INDEX=BR:XS-PS{PS:SMP1}I:Charg-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:SMP1}I:Charg-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Charg_Raw-I,      OUTPUT=BR:XS-PS{PS:SMP1}E:Charg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Charg-I,          INDEX=BR:XS-PS{PS:SMP1}E:Charg-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:SMP1}E:Charg-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Charg-I,          INDEX=BR:XS-PS{PS:SMP1}E:Charg-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:SMP1}E:Charg-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:Charg-I,          INDEX=BR:XS-PS{PS:SMP1}E:Charg-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:SMP1}E:Charg-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:SMP1}E:UVSet_Raw-I,      OUTPUT=BR:XS-PS{PS:SMP1}E:UVSet-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:UVSet-I,          INDEX=BR:XS-PS{PS:SMP1}E:UVSet-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:SMP1}E:UVSet-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:UVSet-I,          INDEX=BR:XS-PS{PS:SMP1}E:UVSet-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:SMP1}E:UVSet-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:SMP1}E:UVSet-I,          INDEX=BR:XS-PS{PS:SMP1}E:UVSet-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:SMP1}E:UVSet-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:SMP1}E:Bank-SP, CH_REF=BR:XS-PS{PS:SMP1}E:Bank-SP_Ref, CH_TOL=BR:XS-PS{PS:SMP1}E:Bank_SP_Tol-SP, CH_ARCH=BR:XS-PS{PS:SMP1}E:Bank_SP_Arch-I, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Bank_SP_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:SMP1}E:Bank_SP_DiffArch-I, CH_FLG=BR:XS-PS{PS:SMP1}E:Bank_SP_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}E:Bank_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:SMP1}E:Bank_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:Bank-SP, CH_REF=BR:XS-PS{PS:SMP1}E:Bank-SP_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Bank_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:Bank_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:Bank-SP, CH_REF=BR:XS-PS{PS:SMP1}E:Bank-SP_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Bank_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:Bank_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:SMP1}E:DAC-I, CH_REF=BR:XS-PS{PS:SMP1}E:DAC-I_Ref, CH_TOL=BR:XS-PS{PS:SMP1}E:DAC_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:SMP1}E:DAC_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:SMP1}E:DAC_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:SMP1}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:SMP1}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:DAC-I, CH_REF=BR:XS-PS{PS:SMP1}E:DAC-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:DAC-I, CH_REF=BR:XS-PS{PS:SMP1}E:Bank-SP-1k, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:SMP1}E:Bank-I, CH_REF=BR:XS-PS{PS:SMP1}E:Bank-I_Ref, CH_TOL=BR:XS-PS{PS:SMP1}E:Bank_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:SMP1}E:Bank_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Bank_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:SMP1}E:Bank_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:SMP1}E:Bank_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}E:Bank_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:SMP1}E:Bank_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:Bank-I, CH_REF=BR:XS-PS{PS:SMP1}E:Bank-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Bank_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:Bank_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:Bank-I, CH_REF=BR:XS-PS{PS:SMP1}E:Bank-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Bank_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:Bank_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:SMP1}I:Charg-I, CH_REF=BR:XS-PS{PS:SMP1}I:Charg-I_Ref, CH_TOL=BR:XS-PS{PS:SMP1}I:Charg_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:SMP1}I:Charg_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:SMP1}I:Charg_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:SMP1}I:Charg_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:SMP1}I:Charg_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}I:Charg_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:SMP1}I:Charg_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}I:Charg-I, CH_REF=BR:XS-PS{PS:SMP1}I:Charg-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}I:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}I:Charg_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}I:Charg-I, CH_REF=BR:XS-PS{PS:SMP1}I:Charg-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}I:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}I:Charg_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:SMP1}E:Charg-I, CH_REF=BR:XS-PS{PS:SMP1}E:Charg-I_Ref, CH_TOL=BR:XS-PS{PS:SMP1}E:Charg_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:SMP1}E:Charg_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Charg_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:SMP1}E:Charg_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:SMP1}E:Charg_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}E:Charg_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:SMP1}E:Charg_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:Charg-I, CH_REF=BR:XS-PS{PS:SMP1}E:Charg-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:Charg_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:Charg-I, CH_REF=BR:XS-PS{PS:SMP1}E:Charg-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:Charg_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:SMP1}E:UVSet-I, CH_REF=BR:XS-PS{PS:SMP1}E:UVSet-I_Ref, CH_TOL=BR:XS-PS{PS:SMP1}E:UVSet_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:SMP1}E:UVSet_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:UVSet_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:SMP1}E:UVSet_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:SMP1}E:UVSet_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}E:UVSet_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:SMP1}E:UVSet_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:UVSet-I, CH_REF=BR:XS-PS{PS:SMP1}E:UVSet-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:UVSet_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:UVSet_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:SMP1}E:UVSet-I, CH_REF=BR:XS-PS{PS:SMP1}E:UVSet-I_Ref, CH_DIFFREF=BR:XS-PS{PS:SMP1}E:UVSet_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}E:UVSet_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:SMP1}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Cmd:RstErr_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:SMP1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:SMP1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:SMP1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:SMP1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:SMP1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Sts:PwrOn-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PwrOn-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Sts:PwrOn_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Sts:PwrOn-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PwrOn-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Sts:PwrOn-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PwrOn-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Flt:PSovrcurr-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:PSovrcurr-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:PSovrcurr-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Flt:PSovrheat-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Flt:PSovrheat_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:PSovrheat-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:PSovrheat-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Flt:Driver-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:Driver-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Flt:Driver_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Flt:Driver_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:Driver-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:Driver-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:Driver-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:Driver-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Driver_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Flt:Bank-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:Bank-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Flt:Bank_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Flt:Bank_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:Bank-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:Bank-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:Bank-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:Bank-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:Bank_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Sts:PulserDoor-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PulserDoor-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Sts:PulserDoor_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Sts:PulserDoor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Sts:PulserDoor-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PulserDoor-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Sts:PulserDoor-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PulserDoor-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PulserDoor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Sts:EmergButton_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Flt:CtrlUnit-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:CtrlUnit-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Flt:CtrlUnit_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Flt:CtrlUnit_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:CtrlUnit-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:CtrlUnit-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Flt:CtrlUnit-Sts, CH_REF=BR:XS-PS{PS:SMP1}Flt:CtrlUnit-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Flt:CtrlUnit_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:SMP1}Sts:PSblock-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PSblock-Sts_Ref, CH_ARCH=BR:XS-PS{PS:SMP1}Sts:PSblock_Arch-Sts, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:SMP1}Sts:PSblock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Sts:PSblock-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PSblock-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:SMP1}Sts:PSblock-Sts, CH_REF=BR:XS-PS{PS:SMP1}Sts:PSblock-Sts_Ref, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:SMP1}Sts:PSblock_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR:XS-PS{PS:BUM1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:XS-PS{PS:BUM1}E:Bank-SP,                             OUTPUT=BR{PSC15}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:00-I,          OUTPUT=BR:XS-PS{PS:BUM1}E:DAC_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:01-I,          OUTPUT=BR:XS-PS{PS:BUM1}E:Bank_Raw-I,    WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:02-I,          OUTPUT=BR:XS-PS{PS:BUM1}I:Charg_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:03-I,          OUTPUT=BR:XS-PS{PS:BUM1}E:Charg_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC15}ADC:04-I,          OUTPUT=BR:XS-PS{PS:BUM1}E:UVSet_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:BUM1}Cmd:RstErr-Cmd,   OUTPUT=BR{PSC15}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:BUM1}Cmd:PwrOn-Cmd,    OUTPUT=BR{PSC15}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:00-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Sts:PwrOn-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:01-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:02-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:03-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:04-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Flt:Driver-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:07-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Flt:Bank-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:08-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Sts:PulserDoor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:09-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:10-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Flt:CtrlUnit-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC15}DI:11-Sts,         OUTPUT=BR:XS-PS{PS:BUM1}Sts:PSblock-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:XS-PS{PS:BUM1}E:Bank-SP, OUTPUT=BR:XS-PS{PS:BUM1}E:Bank_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Bank_Raw-SP-1k,   OUTPUT=BR:XS-PS{PS:BUM1}E:Bank-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Bank-SP-1k,       INDEX=BR:XS-PS{PS:BUM1}E:Bank-SP-1k-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:BUM1}E:Bank-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Bank-SP-1k,       INDEX=BR:XS-PS{PS:BUM1}E:Bank-SP-1k-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:BUM1}E:Bank-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Bank-SP-1k,       INDEX=BR:XS-PS{PS:BUM1}E:Bank-SP-1k-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:BUM1}E:Bank-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:BUM1}E:DAC_Raw-I,        OUTPUT=BR:XS-PS{PS:BUM1}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:DAC-I,            INDEX=BR:XS-PS{PS:BUM1}E:DAC-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:BUM1}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:DAC-I,            INDEX=BR:XS-PS{PS:BUM1}E:DAC-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:BUM1}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:DAC-I,            INDEX=BR:XS-PS{PS:BUM1}E:DAC-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:BUM1}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Bank_Raw-I,       OUTPUT=BR:XS-PS{PS:BUM1}E:Bank-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Bank-I,           INDEX=BR:XS-PS{PS:BUM1}E:Bank-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:BUM1}E:Bank-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Bank-I,           INDEX=BR:XS-PS{PS:BUM1}E:Bank-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:BUM1}E:Bank-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Bank-I,           INDEX=BR:XS-PS{PS:BUM1}E:Bank-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:BUM1}E:Bank-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:BUM1}I:Charg_Raw-I,      OUTPUT=BR:XS-PS{PS:BUM1}I:Charg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}I:Charg-I,          INDEX=BR:XS-PS{PS:BUM1}I:Charg-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:BUM1}I:Charg-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}I:Charg-I,          INDEX=BR:XS-PS{PS:BUM1}I:Charg-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:BUM1}I:Charg-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}I:Charg-I,          INDEX=BR:XS-PS{PS:BUM1}I:Charg-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:BUM1}I:Charg-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Charg_Raw-I,      OUTPUT=BR:XS-PS{PS:BUM1}E:Charg-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Charg-I,          INDEX=BR:XS-PS{PS:BUM1}E:Charg-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:BUM1}E:Charg-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Charg-I,          INDEX=BR:XS-PS{PS:BUM1}E:Charg-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:BUM1}E:Charg-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:Charg-I,          INDEX=BR:XS-PS{PS:BUM1}E:Charg-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:BUM1}E:Charg-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:BUM1}E:UVSet_Raw-I,      OUTPUT=BR:XS-PS{PS:BUM1}E:UVSet-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:UVSet-I,          INDEX=BR:XS-PS{PS:BUM1}E:UVSet-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:BUM1}E:UVSet-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:UVSet-I,          INDEX=BR:XS-PS{PS:BUM1}E:UVSet-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:BUM1}E:UVSet-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:BUM1}E:UVSet-I,          INDEX=BR:XS-PS{PS:BUM1}E:UVSet-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:BUM1}E:UVSet-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:BUM1}E:Bank-SP, CH_REF=BR:XS-PS{PS:BUM1}E:Bank-SP_Ref, CH_TOL=BR:XS-PS{PS:BUM1}E:Bank_SP_Tol-SP, CH_ARCH=BR:XS-PS{PS:BUM1}E:Bank_SP_Arch-I, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Bank_SP_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:BUM1}E:Bank_SP_DiffArch-I, CH_FLG=BR:XS-PS{PS:BUM1}E:Bank_SP_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}E:Bank_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:BUM1}E:Bank_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:Bank-SP, CH_REF=BR:XS-PS{PS:BUM1}E:Bank-SP_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Bank_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:Bank_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:Bank-SP, CH_REF=BR:XS-PS{PS:BUM1}E:Bank-SP_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Bank_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:Bank_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:BUM1}E:DAC-I, CH_REF=BR:XS-PS{PS:BUM1}E:DAC-I_Ref, CH_TOL=BR:XS-PS{PS:BUM1}E:DAC_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:BUM1}E:DAC_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:BUM1}E:DAC_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:BUM1}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:BUM1}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:DAC-I, CH_REF=BR:XS-PS{PS:BUM1}E:DAC-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:DAC-I, CH_REF=BR:XS-PS{PS:BUM1}E:Bank-SP-1k, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:BUM1}E:Bank-I, CH_REF=BR:XS-PS{PS:BUM1}E:Bank-I_Ref, CH_TOL=BR:XS-PS{PS:BUM1}E:Bank_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:BUM1}E:Bank_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Bank_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:BUM1}E:Bank_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:BUM1}E:Bank_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}E:Bank_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:BUM1}E:Bank_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:Bank-I, CH_REF=BR:XS-PS{PS:BUM1}E:Bank-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Bank_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:Bank_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:Bank-I, CH_REF=BR:XS-PS{PS:BUM1}E:Bank-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Bank_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:Bank_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:BUM1}I:Charg-I, CH_REF=BR:XS-PS{PS:BUM1}I:Charg-I_Ref, CH_TOL=BR:XS-PS{PS:BUM1}I:Charg_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:BUM1}I:Charg_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:BUM1}I:Charg_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:BUM1}I:Charg_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:BUM1}I:Charg_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}I:Charg_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:BUM1}I:Charg_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}I:Charg-I, CH_REF=BR:XS-PS{PS:BUM1}I:Charg-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}I:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}I:Charg_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}I:Charg-I, CH_REF=BR:XS-PS{PS:BUM1}I:Charg-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}I:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}I:Charg_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:BUM1}E:Charg-I, CH_REF=BR:XS-PS{PS:BUM1}E:Charg-I_Ref, CH_TOL=BR:XS-PS{PS:BUM1}E:Charg_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:BUM1}E:Charg_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Charg_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:BUM1}E:Charg_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:BUM1}E:Charg_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}E:Charg_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:BUM1}E:Charg_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:Charg-I, CH_REF=BR:XS-PS{PS:BUM1}E:Charg-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:Charg_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:Charg-I, CH_REF=BR:XS-PS{PS:BUM1}E:Charg-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:Charg_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:Charg_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:BUM1}E:UVSet-I, CH_REF=BR:XS-PS{PS:BUM1}E:UVSet-I_Ref, CH_TOL=BR:XS-PS{PS:BUM1}E:UVSet_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:BUM1}E:UVSet_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:UVSet_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:BUM1}E:UVSet_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:BUM1}E:UVSet_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}E:UVSet_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:BUM1}E:UVSet_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:UVSet-I, CH_REF=BR:XS-PS{PS:BUM1}E:UVSet-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:UVSet_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:UVSet_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:BUM1}E:UVSet-I, CH_REF=BR:XS-PS{PS:BUM1}E:UVSet-I_Ref, CH_DIFFREF=BR:XS-PS{PS:BUM1}E:UVSet_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}E:UVSet_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:BUM1}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Cmd:RstErr_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:BUM1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:BUM1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:BUM1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:BUM1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:BUM1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Sts:PwrOn-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PwrOn-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Sts:PwrOn_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Sts:PwrOn-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PwrOn-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Sts:PwrOn-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PwrOn-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Flt:PSovrcurr-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:PSovrcurr-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:PSovrcurr-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Flt:PSovrheat-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Flt:PSovrheat_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:PSovrheat-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:PSovrheat-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Flt:Driver-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:Driver-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Flt:Driver_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Driver_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Flt:Driver_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:Driver-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:Driver-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Driver_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:Driver-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:Driver-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Driver_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Flt:Bank-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:Bank-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Flt:Bank_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Bank_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Flt:Bank_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:Bank-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:Bank-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Bank_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Bank_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:Bank-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:Bank-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Bank_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:Bank_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Sts:PulserDoor-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PulserDoor-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Sts:PulserDoor_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PulserDoor_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Sts:PulserDoor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Sts:PulserDoor-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PulserDoor-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PulserDoor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PulserDoor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Sts:PulserDoor-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PulserDoor-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PulserDoor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PulserDoor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Sts:EmergButton_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Flt:CtrlUnit-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:CtrlUnit-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Flt:CtrlUnit_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Flt:CtrlUnit_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Flt:CtrlUnit_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:CtrlUnit-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:CtrlUnit-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:CtrlUnit_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:CtrlUnit_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Flt:CtrlUnit-Sts, CH_REF=BR:XS-PS{PS:BUM1}Flt:CtrlUnit-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Flt:CtrlUnit_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Flt:CtrlUnit_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:BUM1}Sts:PSblock-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PSblock-Sts_Ref, CH_ARCH=BR:XS-PS{PS:BUM1}Sts:PSblock_Arch-Sts, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PSblock_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:BUM1}Sts:PSblock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Sts:PSblock-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PSblock-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PSblock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PSblock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:BUM1}Sts:PSblock-Sts, CH_REF=BR:XS-PS{PS:BUM1}Sts:PSblock-Sts_Ref, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PSblock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:BUM1}Sts:PSblock_MonitFlg-Sts, MODE=1, ENABLED=0")


var(PSCDebug, 1)
#with debug message: var(PSCDebug, 2)

#Tx socket
createPSC("TxPSC13", "br-psc13", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC13", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC13", "br-psc13", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC13", 80, 128)

#Tx socket
createPSC("TxPSC14", "br-psc14", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC14", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC14", "br-psc14", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC14", 80, 128)

#Tx socket
createPSC("TxPSC15", "br-psc15", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC15", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC15", "br-psc15", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC15", 80, 128)

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

