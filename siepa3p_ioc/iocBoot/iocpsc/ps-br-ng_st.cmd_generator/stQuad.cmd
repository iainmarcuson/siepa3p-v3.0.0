#!../../bin/linux-x86/psc

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
epicsEnvSet("EPICS_CA_ADDR_LIST","10.0.153.255")
epicsEnvSet("IOCNAME", "ps-br-quad-ng")

#epicsThreadSleep 5

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/psc.dbd",0,0)
psc_registerRecordDeviceDriver(pdbbase)

## Load record instances

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC04")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC04")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC04, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:00_Raw-I,  OUTPUT=BR{PSC04}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:01_Raw-I,  OUTPUT=BR{PSC04}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:02_Raw-I,  OUTPUT=BR{PSC04}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:03_Raw-I,  OUTPUT=BR{PSC04}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:04_Raw-I,  OUTPUT=BR{PSC04}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:05_Raw-I,  OUTPUT=BR{PSC04}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:06_Raw-I,  OUTPUT=BR{PSC04}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:07_Raw-I,  OUTPUT=BR{PSC04}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:08_Raw-I,  OUTPUT=BR{PSC04}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:09_Raw-I,  OUTPUT=BR{PSC04}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:10_Raw-I,  OUTPUT=BR{PSC04}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:11_Raw-I,  OUTPUT=BR{PSC04}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:12_Raw-I,  OUTPUT=BR{PSC04}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:13_Raw-I,  OUTPUT=BR{PSC04}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:14_Raw-I,  OUTPUT=BR{PSC04}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:15_Raw-I,  OUTPUT=BR{PSC04}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:16_Raw-I,  OUTPUT=BR{PSC04}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:17_Raw-I,  OUTPUT=BR{PSC04}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC04}ADC10k:0_Raw-I,  OUTPUT=BR{PSC04}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC04}ADC10k:1_Raw-I,  OUTPUT=BR{PSC04}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC04}ADC10k:0-I, INPUT2=BR{PSC04}ADC10k:1-I, OUTPUT=BR{PSC04}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC04}ADC10k:0_Raw-I,  OUTPUT=BR{PSC04}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC04}ADC10k:1_Raw-I,  OUTPUT=BR{PSC04}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC04, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}Quad_Delta-SP, DELTA_STEPS=BR-PS{}Quad_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC04}DAC:0-SP,         OUTPUT=BR{PSC04}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC04}DAC:0_Raw-SP,     OUTPUT=BR{PSC04}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC04}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC04}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC04, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}Quad_Delta-SP, DELTA_STEPS=BR-PS{}Quad_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC04}DAC:1-SP,         OUTPUT=BR{PSC04}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC04}DAC:1_Raw-SP,     OUTPUT=BR{PSC04}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC04}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC04}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC05")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC05")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC05, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:00_Raw-I,  OUTPUT=BR{PSC05}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:01_Raw-I,  OUTPUT=BR{PSC05}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:02_Raw-I,  OUTPUT=BR{PSC05}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:03_Raw-I,  OUTPUT=BR{PSC05}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:04_Raw-I,  OUTPUT=BR{PSC05}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:05_Raw-I,  OUTPUT=BR{PSC05}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:06_Raw-I,  OUTPUT=BR{PSC05}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:07_Raw-I,  OUTPUT=BR{PSC05}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:08_Raw-I,  OUTPUT=BR{PSC05}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:09_Raw-I,  OUTPUT=BR{PSC05}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:10_Raw-I,  OUTPUT=BR{PSC05}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:11_Raw-I,  OUTPUT=BR{PSC05}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:12_Raw-I,  OUTPUT=BR{PSC05}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:13_Raw-I,  OUTPUT=BR{PSC05}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:14_Raw-I,  OUTPUT=BR{PSC05}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:15_Raw-I,  OUTPUT=BR{PSC05}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:16_Raw-I,  OUTPUT=BR{PSC05}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:17_Raw-I,  OUTPUT=BR{PSC05}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC05}ADC10k:0_Raw-I,  OUTPUT=BR{PSC05}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC05}ADC10k:1_Raw-I,  OUTPUT=BR{PSC05}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC05}ADC10k:0-I, INPUT2=BR{PSC05}ADC10k:1-I, OUTPUT=BR{PSC05}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC05}ADC10k:0_Raw-I,  OUTPUT=BR{PSC05}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC05}ADC10k:1_Raw-I,  OUTPUT=BR{PSC05}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC05, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}Quad_Delta-SP, DELTA_STEPS=BR-PS{}Quad_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC05}DAC:0-SP,         OUTPUT=BR{PSC05}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC05}DAC:0_Raw-SP,     OUTPUT=BR{PSC05}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC05}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC05}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC05, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}Quad_Delta-SP, DELTA_STEPS=BR-PS{}Quad_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC05}DAC:1-SP,         OUTPUT=BR{PSC05}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC05}DAC:1_Raw-SP,     OUTPUT=BR{PSC05}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC05}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC05}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC06")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC06")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC06, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:00_Raw-I,  OUTPUT=BR{PSC06}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:01_Raw-I,  OUTPUT=BR{PSC06}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:02_Raw-I,  OUTPUT=BR{PSC06}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:03_Raw-I,  OUTPUT=BR{PSC06}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:04_Raw-I,  OUTPUT=BR{PSC06}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:05_Raw-I,  OUTPUT=BR{PSC06}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:06_Raw-I,  OUTPUT=BR{PSC06}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:07_Raw-I,  OUTPUT=BR{PSC06}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:08_Raw-I,  OUTPUT=BR{PSC06}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:09_Raw-I,  OUTPUT=BR{PSC06}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:10_Raw-I,  OUTPUT=BR{PSC06}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:11_Raw-I,  OUTPUT=BR{PSC06}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:12_Raw-I,  OUTPUT=BR{PSC06}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:13_Raw-I,  OUTPUT=BR{PSC06}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:14_Raw-I,  OUTPUT=BR{PSC06}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:15_Raw-I,  OUTPUT=BR{PSC06}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:16_Raw-I,  OUTPUT=BR{PSC06}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:17_Raw-I,  OUTPUT=BR{PSC06}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC06}ADC10k:0_Raw-I,  OUTPUT=BR{PSC06}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC06}ADC10k:1_Raw-I,  OUTPUT=BR{PSC06}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC06}ADC10k:0-I, INPUT2=BR{PSC06}ADC10k:1-I, OUTPUT=BR{PSC06}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC06}ADC10k:0_Raw-I,  OUTPUT=BR{PSC06}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC06}ADC10k:1_Raw-I,  OUTPUT=BR{PSC06}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC06, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}Quad_Delta-SP, DELTA_STEPS=BR-PS{}Quad_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC06}DAC:0-SP,         OUTPUT=BR{PSC06}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC06}DAC:0_Raw-SP,     OUTPUT=BR{PSC06}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC06}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC06}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC06, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}Quad_Delta-SP, DELTA_STEPS=BR-PS{}Quad_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC06}DAC:1-SP,         OUTPUT=BR{PSC06}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC06}DAC:1_Raw-SP,     OUTPUT=BR{PSC06}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC06}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC06}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

# BR-PS{PS:QF} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:QF}I-SP,              OUTPUT=BR{PSC04}DAC:0-SP,    WF_LENGTH=10150")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:QF}E:FdFwd-SP,        OUTPUT=BR{PSC04}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:00-I,          OUTPUT=BR-PS{PS:QF}I:DAC_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:01-I,          OUTPUT=BR-PS{PS:QF}I_Raw-I,         WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:02-I,          OUTPUT=BR-PS{PS:QF}I:DCCT2_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:03-I,          OUTPUT=BR-PS{PS:QF}I:PSinput_Raw-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:04-I,          OUTPUT=BR-PS{PS:QF}T:PS_Raw-I,      WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:05-I,          OUTPUT=BR-PS{PS:QF}E:PSinput_Raw-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:06-I,          OUTPUT=BR-PS{PS:QF}E:PSoutput_Raw-I,WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:07-I,          OUTPUT=BR-PS{PS:QF}I:Err_Raw-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC04}ADC:08-I,          OUTPUT=BR-PS{PS:QF}E:DAC2_Raw-I,    WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:QF}Cmd:RstErr-Cmd,    OUTPUT=BR{PSC04}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:QF}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC04}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:00-Sts,         OUTPUT=BR-PS{PS:QF}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:01-Sts,         OUTPUT=BR-PS{PS:QF}Sts:PwrOn-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:02-Sts,         OUTPUT=BR-PS{PS:QF}Sts:ChargCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:03-Sts,         OUTPUT=BR-PS{PS:QF}Sts:ChargRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:08-Sts,         OUTPUT=BR-PS{PS:QF}Flt:RegOvrload-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:09-Sts,         OUTPUT=BR-PS{PS:QF}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:10-Sts,         OUTPUT=BR-PS{PS:QF}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:11-Sts,         OUTPUT=BR-PS{PS:QF}Flt:Driver-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:12-Sts,         OUTPUT=BR-PS{PS:QF}Flt:DCCT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:14-Sts,         OUTPUT=BR-PS{PS:QF}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC04}DI:15-Sts,         OUTPUT=BR-PS{PS:QF}Sts:PSwater-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:QF}I-SP, OUTPUT=BR-PS{PS:QF}I_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:QF}E:FdFwd-SP, OUTPUT=BR-PS{PS:QF}E:FdFwd_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}I_Raw-SP-1k,   OUTPUT=BR-PS{PS:QF}I-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I-SP-1k,       INDEX=BR-PS{PS:QF}I-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}I-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I-SP-1k,       INDEX=BR-PS{PS:QF}I-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}I-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I-SP-1k,       INDEX=BR-PS{PS:QF}I-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}I-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}E:FdFwd_Raw-SP-1k, OUTPUT=BR-PS{PS:QF}E:FdFwd-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QF}E:FdFwd-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}E:FdFwd-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QF}E:FdFwd-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}E:FdFwd-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QF}E:FdFwd-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}E:FdFwd-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}I:DAC_Raw-I,   OUTPUT=BR-PS{PS:QF}I:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:DAC-I,       INDEX=BR-PS{PS:QF}I:DAC-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}I:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:DAC-I,       INDEX=BR-PS{PS:QF}I:DAC-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}I:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:DAC-I,       INDEX=BR-PS{PS:QF}I:DAC-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}I:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}I_Raw-I,   OUTPUT=BR-PS{PS:QF}I-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I-I,       INDEX=BR-PS{PS:QF}I-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}I-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I-I,       INDEX=BR-PS{PS:QF}I-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}I-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I-I,       INDEX=BR-PS{PS:QF}I-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}I-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}I:DCCT2_Raw-I, OUTPUT=BR-PS{PS:QF}I:DCCT2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:DCCT2-I,     INDEX=BR-PS{PS:QF}I:DCCT2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}I:DCCT2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:DCCT2-I,     INDEX=BR-PS{PS:QF}I:DCCT2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}I:DCCT2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:DCCT2-I,     INDEX=BR-PS{PS:QF}I:DCCT2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}I:DCCT2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}I:PSinput_Raw-I,     OUTPUT=BR-PS{PS:QF}I:PSinput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:PSinput-I,       INDEX=BR-PS{PS:QF}I:PSinput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}I:PSinput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:PSinput-I,       INDEX=BR-PS{PS:QF}I:PSinput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}I:PSinput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:PSinput-I,       INDEX=BR-PS{PS:QF}I:PSinput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}I:PSinput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}T:PS_Raw-I,     OUTPUT=BR-PS{PS:QF}T:PS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}T:PS-I,       INDEX=BR-PS{PS:QF}T:PS-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}T:PS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}T:PS-I,       INDEX=BR-PS{PS:QF}T:PS-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}T:PS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}T:PS-I,       INDEX=BR-PS{PS:QF}T:PS-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}T:PS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}E:PSinput_Raw-I,     OUTPUT=BR-PS{PS:QF}E:PSinput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:PSinput-I,       INDEX=BR-PS{PS:QF}E:PSinput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}E:PSinput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:PSinput-I,       INDEX=BR-PS{PS:QF}E:PSinput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}E:PSinput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:PSinput-I,       INDEX=BR-PS{PS:QF}E:PSinput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}E:PSinput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}E:PSoutput_Raw-I,     OUTPUT=BR-PS{PS:QF}E:PSoutput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:PSoutput-I,       INDEX=BR-PS{PS:QF}E:PSoutput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}E:PSoutput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:PSoutput-I,       INDEX=BR-PS{PS:QF}E:PSoutput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}E:PSoutput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:PSoutput-I,       INDEX=BR-PS{PS:QF}E:PSoutput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}E:PSoutput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}I:Err_Raw-I,   OUTPUT=BR-PS{PS:QF}I:Err-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:Err-I,       INDEX=BR-PS{PS:QF}I:Err-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}I:Err-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:Err-I,       INDEX=BR-PS{PS:QF}I:Err-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}I:Err-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}I:Err-I,       INDEX=BR-PS{PS:QF}I:Err-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}I:Err-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QF}E:DAC2_Raw-I,     OUTPUT=BR-PS{PS:QF}E:DAC2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:DAC2-I,       INDEX=BR-PS{PS:QF}E:DAC2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QF}E:DAC2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:DAC2-I,       INDEX=BR-PS{PS:QF}E:DAC2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QF}E:DAC2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QF}E:DAC2-I,       INDEX=BR-PS{PS:QF}E:DAC2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QF}E:DAC2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}I-SP, CH_REF=BR-PS{PS:QF}I-SP_Ref, CH_TOL=BR-PS{PS:QF}I_SP_Tol-SP, CH_ARCH=BR-PS{PS:QF}I_SP_Arch-I, CH_DIFFREF=BR-PS{PS:QF}I_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}I_SP_DiffArch-I, CH_FLG=BR-PS{PS:QF}I_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}I_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}I_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I-SP, CH_REF=BR-PS{PS:QF}I-SP_Ref, CH_DIFFREF=BR-PS{PS:QF}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I-SP, CH_REF=BR-PS{PS:QF}I-SP_Ref, CH_DIFFREF=BR-PS{PS:QF}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}E:FdFwd-SP, CH_REF=BR-PS{PS:QF}E:FdFwd-SP_Ref, CH_TOL=BR-PS{PS:QF}E:FdFwd_SP_Tol-SP, CH_ARCH=BR-PS{PS:QF}E:FdFwd_SP_Arch-I, CH_DIFFREF=BR-PS{PS:QF}E:FdFwd_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}E:FdFwd_SP_DiffArch-I, CH_FLG=BR-PS{PS:QF}E:FdFwd_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}E:FdFwd_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}E:FdFwd_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}E:FdFwd-SP, CH_REF=BR-PS{PS:QF}E:FdFwd-SP_Ref, CH_DIFFREF=BR-PS{PS:QF}E:FdFwd_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}E:FdFwd_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}E:FdFwd-SP, CH_REF=BR-PS{PS:QF}E:FdFwd-SP_Ref, CH_DIFFREF=BR-PS{PS:QF}E:FdFwd_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}E:FdFwd_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}I:DAC-I, CH_REF=BR-PS{PS:QF}I:DAC-I_Ref, CH_TOL=BR-PS{PS:QF}I:DAC_I_Tol-SP,  CH_ARCH=BR-PS{PS:QF}I:DAC_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}I:DAC_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}I:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}I:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I:DAC-I, CH_REF=BR-PS{PS:QF}I:DAC-I_Ref, CH_DIFFREF=BR-PS{PS:QF}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I:DAC-I, CH_REF=BR-PS{PS:QF}I-SP-1k, CH_DIFFREF=BR-PS{PS:QF}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}I-I, CH_REF=BR-PS{PS:QF}I-I_Ref, CH_TOL=BR-PS{PS:QF}I_I_Tol-SP, CH_ARCH=BR-PS{PS:QF}I_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}I_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}I_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}I_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}I_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}I_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I-I, CH_REF=BR-PS{PS:QF}I-I_Ref, CH_DIFFREF=BR-PS{PS:QF}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I-I, CH_REF=BR-PS{PS:QF}I-SP-1k, CH_DIFFREF=BR-PS{PS:QF}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}I:DCCT2-I, CH_REF=BR-PS{PS:QF}I:DCCT2-I_Ref, CH_TOL=BR-PS{PS:QF}I:DCCT2_I_Tol-SP, CH_ARCH=BR-PS{PS:QF}I:DCCT2_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}I:DCCT2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}I:DCCT2_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}I:DCCT2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}I:DCCT2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}I:DCCT2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I:DCCT2-I, CH_REF=BR-PS{PS:QF}I:DCCT2-I_Ref, CH_DIFFREF=BR-PS{PS:QF}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I:DCCT2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I:DCCT2-I, CH_REF=BR-PS{PS:QF}I-SP-1k, CH_DIFFREF=BR-PS{PS:QF}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I:DCCT2_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}I:PSinput-I, CH_REF=BR-PS{PS:QF}I:PSinput-I_Ref, CH_TOL=BR-PS{PS:QF}I:PSinput_I_Tol-SP, CH_ARCH=BR-PS{PS:QF}I:PSinput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}I:PSinput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}I:PSinput_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}I:PSinput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}I:PSinput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}I:PSinput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I:PSinput-I, CH_REF=BR-PS{PS:QF}I:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QF}I:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I:PSinput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I:PSinput-I, CH_REF=BR-PS{PS:QF}I:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QF}I:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I:PSinput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}T:PS-I, CH_REF=BR-PS{PS:QF}T:PS-I_Ref, CH_TOL=BR-PS{PS:QF}T:PS_I_Tol-SP, CH_ARCH=BR-PS{PS:QF}T:PS_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}T:PS_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}T:PS_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}T:PS_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}T:PS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}T:PS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}T:PS-I, CH_REF=BR-PS{PS:QF}T:PS-I_Ref, CH_DIFFREF=BR-PS{PS:QF}T:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}T:PS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}T:PS-I, CH_REF=BR-PS{PS:QF}T:PS-I_Ref, CH_DIFFREF=BR-PS{PS:QF}T:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}T:PS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}E:PSinput-I, CH_REF=BR-PS{PS:QF}E:PSinput-I_Ref, CH_TOL=BR-PS{PS:QF}E:PSinput_I_Tol-SP, CH_ARCH=BR-PS{PS:QF}E:PSinput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}E:PSinput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}E:PSinput_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}E:PSinput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}E:PSinput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}E:PSinput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}E:PSinput-I, CH_REF=BR-PS{PS:QF}E:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QF}E:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}E:PSinput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}E:PSinput-I, CH_REF=BR-PS{PS:QF}E:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QF}E:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}E:PSinput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}E:PSoutput-I, CH_REF=BR-PS{PS:QF}E:PSoutput-I_Ref, CH_TOL=BR-PS{PS:QF}E:PSoutput_I_Tol-SP, CH_ARCH=BR-PS{PS:QF}E:PSoutput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}E:PSoutput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}E:PSoutput_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}E:PSoutput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}E:PSoutput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}E:PSoutput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}E:PSoutput-I, CH_REF=BR-PS{PS:QF}E:PSoutput-I_Ref, CH_DIFFREF=BR-PS{PS:QF}E:PSoutput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}E:PSoutput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}E:PSoutput-I, CH_REF=BR-PS{PS:QF}E:PSoutput-I_Ref, CH_DIFFREF=BR-PS{PS:QF}E:PSoutput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}E:PSoutput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}I:Err-I, CH_REF=BR-PS{PS:QF}I:Err-I_Ref, CH_TOL=BR-PS{PS:QF}I:Err_I_Tol-SP, CH_ARCH=BR-PS{PS:QF}I:Err_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}I:Err_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}I:Err_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}I:Err_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}I:Err_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}I:Err_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I:Err-I, CH_REF=BR-PS{PS:QF}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:QF}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I:Err_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}I:Err-I, CH_REF=BR-PS{PS:QF}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:QF}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}I:Err_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QF}E:DAC2-I, CH_REF=BR-PS{PS:QF}E:DAC2-I_Ref, CH_TOL=BR-PS{PS:QF}E:DAC2_I_Tol-SP, CH_ARCH=BR-PS{PS:QF}E:DAC2_I_Arch-I, CH_DIFFREF=BR-PS{PS:QF}E:DAC2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QF}E:DAC2_I_DiffArch-I, CH_FLG=BR-PS{PS:QF}E:DAC2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}E:DAC2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QF}E:DAC2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}E:DAC2-I, CH_REF=BR-PS{PS:QF}E:DAC2-I_Ref, CH_DIFFREF=BR-PS{PS:QF}E:DAC2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}E:DAC2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QF}E:DAC2-I, CH_REF=BR-PS{PS:QF}E:DAC2-I_Ref, CH_DIFFREF=BR-PS{PS:QF}E:DAC2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}E:DAC2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QF}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR-PS{PS:QF}Cmd:RstErr_Arch-Sts, CH_FLG=BR-PS{PS:QF}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QF}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:QF}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QF}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:QF}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QF}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR-PS{PS:QF}Cmd:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:QF}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QF}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:QF}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QF}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:QF}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QF}Sts:Rdy-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Sts:Rdy_Arch-Sts, CH_FLG=BR-PS{PS:QF}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QF}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QF}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QF}Sts:PwrOn-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Sts:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:QF}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QF}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QF}Cmd:PwrOn-Cmd, CH_FLG=BR-PS{PS:QF}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=1")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QF}Sts:ChargCircBreaker-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Sts:ChargCircBreaker_Arch-Sts, CH_FLG=BR-PS{PS:QF}Sts:ChargCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Sts:ChargCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QF}Sts:ChargCircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:ChargCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:ChargCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QF}Sts:ChargCircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:ChargCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:ChargCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QF}Sts:ChargRdy-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Sts:ChargRdy_Arch-Sts, CH_FLG=BR-PS{PS:QF}Sts:ChargRdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Sts:ChargRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QF}Sts:ChargRdy-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:ChargRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:ChargRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QF}Sts:ChargRdy-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:ChargRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:ChargRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QF}Flt:RegOvrload-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Flt:RegOvrload_Arch-Sts, CH_FLG=BR-PS{PS:QF}Flt:RegOvrload_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Flt:RegOvrload_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QF}Flt:RegOvrload-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:RegOvrload_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:RegOvrload_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QF}Flt:RegOvrload-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:RegOvrload_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:RegOvrload_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QF}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR-PS{PS:QF}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QF}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QF}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QF}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Flt:PSovrheat_Arch-Sts, CH_FLG=BR-PS{PS:QF}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QF}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QF}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Flt:Driver-Sts, CH_REF=BR-PS{PS:QF}Flt:Driver-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Flt:Driver_Arch-Sts, CH_FLG=BR-PS{PS:QF}Flt:Driver_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Flt:Driver_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:Driver-Sts, CH_REF=BR-PS{PS:QF}Flt:Driver-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:Driver_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:Driver-Sts, CH_REF=BR-PS{PS:QF}Flt:Driver-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:Driver_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QF}Flt:DCCT-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Flt:DCCT_Arch-Sts, CH_FLG=BR-PS{PS:QF}Flt:DCCT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Flt:DCCT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QF}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:DCCT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QF}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:QF}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Flt:DCCT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QF}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR-PS{PS:QF}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QF}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QF}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QF}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QF}Sts:PSwater-Sts_Ref, CH_ARCH=BR-PS{PS:QF}Sts:PSwater_Arch-Sts, CH_FLG=BR-PS{PS:QF}Sts:PSwater_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QF}Sts:PSwater_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QF}Sts:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:PSwater_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QF}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QF}Sts:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:QF}Sts:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QF}Sts:PSwater_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR-PS{PS:QD} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:QD}I-SP,              OUTPUT=BR{PSC05}DAC:0-SP,    WF_LENGTH=10150")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:QD}E:FdFwd-SP,        OUTPUT=BR{PSC05}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:00-I,          OUTPUT=BR-PS{PS:QD}I:DAC_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:01-I,          OUTPUT=BR-PS{PS:QD}I_Raw-I,         WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:02-I,          OUTPUT=BR-PS{PS:QD}I:DCCT2_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:03-I,          OUTPUT=BR-PS{PS:QD}I:PSinput_Raw-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:04-I,          OUTPUT=BR-PS{PS:QD}T:PS_Raw-I,      WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:05-I,          OUTPUT=BR-PS{PS:QD}E:PSinput_Raw-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:06-I,          OUTPUT=BR-PS{PS:QD}E:PSoutput_Raw-I,WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:07-I,          OUTPUT=BR-PS{PS:QD}I:Err_Raw-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC05}ADC:08-I,          OUTPUT=BR-PS{PS:QD}E:DAC2_Raw-I,    WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:QD}Cmd:RstErr-Cmd,    OUTPUT=BR{PSC05}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:QD}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC05}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:00-Sts,         OUTPUT=BR-PS{PS:QD}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:01-Sts,         OUTPUT=BR-PS{PS:QD}Sts:PwrOn-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:02-Sts,         OUTPUT=BR-PS{PS:QD}Sts:ChargCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:03-Sts,         OUTPUT=BR-PS{PS:QD}Sts:ChargRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:08-Sts,         OUTPUT=BR-PS{PS:QD}Flt:RegOvrload-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:09-Sts,         OUTPUT=BR-PS{PS:QD}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:10-Sts,         OUTPUT=BR-PS{PS:QD}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:11-Sts,         OUTPUT=BR-PS{PS:QD}Flt:Driver-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:12-Sts,         OUTPUT=BR-PS{PS:QD}Flt:DCCT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:14-Sts,         OUTPUT=BR-PS{PS:QD}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC05}DI:15-Sts,         OUTPUT=BR-PS{PS:QD}Sts:PSwater-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:QD}I-SP, OUTPUT=BR-PS{PS:QD}I_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:QD}E:FdFwd-SP, OUTPUT=BR-PS{PS:QD}E:FdFwd_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}I_Raw-SP-1k,   OUTPUT=BR-PS{PS:QD}I-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I-SP-1k,       INDEX=BR-PS{PS:QD}I-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}I-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I-SP-1k,       INDEX=BR-PS{PS:QD}I-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}I-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I-SP-1k,       INDEX=BR-PS{PS:QD}I-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}I-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}E:FdFwd_Raw-SP-1k, OUTPUT=BR-PS{PS:QD}E:FdFwd-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QD}E:FdFwd-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}E:FdFwd-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QD}E:FdFwd-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}E:FdFwd-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QD}E:FdFwd-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}E:FdFwd-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}I:DAC_Raw-I,   OUTPUT=BR-PS{PS:QD}I:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:DAC-I,       INDEX=BR-PS{PS:QD}I:DAC-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}I:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:DAC-I,       INDEX=BR-PS{PS:QD}I:DAC-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}I:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:DAC-I,       INDEX=BR-PS{PS:QD}I:DAC-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}I:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}I_Raw-I,   OUTPUT=BR-PS{PS:QD}I-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I-I,       INDEX=BR-PS{PS:QD}I-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}I-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I-I,       INDEX=BR-PS{PS:QD}I-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}I-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I-I,       INDEX=BR-PS{PS:QD}I-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}I-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}I:DCCT2_Raw-I, OUTPUT=BR-PS{PS:QD}I:DCCT2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:DCCT2-I,     INDEX=BR-PS{PS:QD}I:DCCT2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}I:DCCT2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:DCCT2-I,     INDEX=BR-PS{PS:QD}I:DCCT2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}I:DCCT2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:DCCT2-I,     INDEX=BR-PS{PS:QD}I:DCCT2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}I:DCCT2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}I:PSinput_Raw-I,     OUTPUT=BR-PS{PS:QD}I:PSinput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:PSinput-I,       INDEX=BR-PS{PS:QD}I:PSinput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}I:PSinput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:PSinput-I,       INDEX=BR-PS{PS:QD}I:PSinput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}I:PSinput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:PSinput-I,       INDEX=BR-PS{PS:QD}I:PSinput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}I:PSinput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}T:PS_Raw-I,     OUTPUT=BR-PS{PS:QD}T:PS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}T:PS-I,       INDEX=BR-PS{PS:QD}T:PS-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}T:PS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}T:PS-I,       INDEX=BR-PS{PS:QD}T:PS-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}T:PS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}T:PS-I,       INDEX=BR-PS{PS:QD}T:PS-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}T:PS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}E:PSinput_Raw-I,     OUTPUT=BR-PS{PS:QD}E:PSinput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:PSinput-I,       INDEX=BR-PS{PS:QD}E:PSinput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}E:PSinput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:PSinput-I,       INDEX=BR-PS{PS:QD}E:PSinput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}E:PSinput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:PSinput-I,       INDEX=BR-PS{PS:QD}E:PSinput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}E:PSinput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}E:PSoutput_Raw-I,     OUTPUT=BR-PS{PS:QD}E:PSoutput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:PSoutput-I,       INDEX=BR-PS{PS:QD}E:PSoutput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}E:PSoutput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:PSoutput-I,       INDEX=BR-PS{PS:QD}E:PSoutput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}E:PSoutput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:PSoutput-I,       INDEX=BR-PS{PS:QD}E:PSoutput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}E:PSoutput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}I:Err_Raw-I,   OUTPUT=BR-PS{PS:QD}I:Err-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:Err-I,       INDEX=BR-PS{PS:QD}I:Err-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}I:Err-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:Err-I,       INDEX=BR-PS{PS:QD}I:Err-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}I:Err-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}I:Err-I,       INDEX=BR-PS{PS:QD}I:Err-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}I:Err-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QD}E:DAC2_Raw-I,     OUTPUT=BR-PS{PS:QD}E:DAC2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:DAC2-I,       INDEX=BR-PS{PS:QD}E:DAC2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QD}E:DAC2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:DAC2-I,       INDEX=BR-PS{PS:QD}E:DAC2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QD}E:DAC2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QD}E:DAC2-I,       INDEX=BR-PS{PS:QD}E:DAC2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QD}E:DAC2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}I-SP, CH_REF=BR-PS{PS:QD}I-SP_Ref, CH_TOL=BR-PS{PS:QD}I_SP_Tol-SP, CH_ARCH=BR-PS{PS:QD}I_SP_Arch-I, CH_DIFFREF=BR-PS{PS:QD}I_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}I_SP_DiffArch-I, CH_FLG=BR-PS{PS:QD}I_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}I_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}I_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I-SP, CH_REF=BR-PS{PS:QD}I-SP_Ref, CH_DIFFREF=BR-PS{PS:QD}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I-SP, CH_REF=BR-PS{PS:QD}I-SP_Ref, CH_DIFFREF=BR-PS{PS:QD}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}E:FdFwd-SP, CH_REF=BR-PS{PS:QD}E:FdFwd-SP_Ref, CH_TOL=BR-PS{PS:QD}E:FdFwd_SP_Tol-SP, CH_ARCH=BR-PS{PS:QD}E:FdFwd_SP_Arch-I, CH_DIFFREF=BR-PS{PS:QD}E:FdFwd_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}E:FdFwd_SP_DiffArch-I, CH_FLG=BR-PS{PS:QD}E:FdFwd_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}E:FdFwd_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}E:FdFwd_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}E:FdFwd-SP, CH_REF=BR-PS{PS:QD}E:FdFwd-SP_Ref, CH_DIFFREF=BR-PS{PS:QD}E:FdFwd_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}E:FdFwd_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}E:FdFwd-SP, CH_REF=BR-PS{PS:QD}E:FdFwd-SP_Ref, CH_DIFFREF=BR-PS{PS:QD}E:FdFwd_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}E:FdFwd_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}I:DAC-I, CH_REF=BR-PS{PS:QD}I:DAC-I_Ref, CH_TOL=BR-PS{PS:QD}I:DAC_I_Tol-SP,  CH_ARCH=BR-PS{PS:QD}I:DAC_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}I:DAC_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}I:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}I:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I:DAC-I, CH_REF=BR-PS{PS:QD}I:DAC-I_Ref, CH_DIFFREF=BR-PS{PS:QD}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I:DAC-I, CH_REF=BR-PS{PS:QD}I-SP-1k, CH_DIFFREF=BR-PS{PS:QD}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}I-I, CH_REF=BR-PS{PS:QD}I-I_Ref, CH_TOL=BR-PS{PS:QD}I_I_Tol-SP, CH_ARCH=BR-PS{PS:QD}I_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}I_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}I_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}I_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}I_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}I_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I-I, CH_REF=BR-PS{PS:QD}I-I_Ref, CH_DIFFREF=BR-PS{PS:QD}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I-I, CH_REF=BR-PS{PS:QD}I-SP-1k, CH_DIFFREF=BR-PS{PS:QD}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}I:DCCT2-I, CH_REF=BR-PS{PS:QD}I:DCCT2-I_Ref, CH_TOL=BR-PS{PS:QD}I:DCCT2_I_Tol-SP, CH_ARCH=BR-PS{PS:QD}I:DCCT2_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}I:DCCT2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}I:DCCT2_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}I:DCCT2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}I:DCCT2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}I:DCCT2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I:DCCT2-I, CH_REF=BR-PS{PS:QD}I:DCCT2-I_Ref, CH_DIFFREF=BR-PS{PS:QD}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I:DCCT2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I:DCCT2-I, CH_REF=BR-PS{PS:QD}I-SP-1k, CH_DIFFREF=BR-PS{PS:QD}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I:DCCT2_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}I:PSinput-I, CH_REF=BR-PS{PS:QD}I:PSinput-I_Ref, CH_TOL=BR-PS{PS:QD}I:PSinput_I_Tol-SP, CH_ARCH=BR-PS{PS:QD}I:PSinput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}I:PSinput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}I:PSinput_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}I:PSinput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}I:PSinput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}I:PSinput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I:PSinput-I, CH_REF=BR-PS{PS:QD}I:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QD}I:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I:PSinput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I:PSinput-I, CH_REF=BR-PS{PS:QD}I:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QD}I:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I:PSinput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}T:PS-I, CH_REF=BR-PS{PS:QD}T:PS-I_Ref, CH_TOL=BR-PS{PS:QD}T:PS_I_Tol-SP, CH_ARCH=BR-PS{PS:QD}T:PS_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}T:PS_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}T:PS_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}T:PS_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}T:PS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}T:PS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}T:PS-I, CH_REF=BR-PS{PS:QD}T:PS-I_Ref, CH_DIFFREF=BR-PS{PS:QD}T:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}T:PS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}T:PS-I, CH_REF=BR-PS{PS:QD}T:PS-I_Ref, CH_DIFFREF=BR-PS{PS:QD}T:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}T:PS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}E:PSinput-I, CH_REF=BR-PS{PS:QD}E:PSinput-I_Ref, CH_TOL=BR-PS{PS:QD}E:PSinput_I_Tol-SP, CH_ARCH=BR-PS{PS:QD}E:PSinput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}E:PSinput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}E:PSinput_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}E:PSinput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}E:PSinput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}E:PSinput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}E:PSinput-I, CH_REF=BR-PS{PS:QD}E:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QD}E:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}E:PSinput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}E:PSinput-I, CH_REF=BR-PS{PS:QD}E:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QD}E:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}E:PSinput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}E:PSoutput-I, CH_REF=BR-PS{PS:QD}E:PSoutput-I_Ref, CH_TOL=BR-PS{PS:QD}E:PSoutput_I_Tol-SP, CH_ARCH=BR-PS{PS:QD}E:PSoutput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}E:PSoutput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}E:PSoutput_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}E:PSoutput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}E:PSoutput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}E:PSoutput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}E:PSoutput-I, CH_REF=BR-PS{PS:QD}E:PSoutput-I_Ref, CH_DIFFREF=BR-PS{PS:QD}E:PSoutput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}E:PSoutput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}E:PSoutput-I, CH_REF=BR-PS{PS:QD}E:PSoutput-I_Ref, CH_DIFFREF=BR-PS{PS:QD}E:PSoutput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}E:PSoutput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}I:Err-I, CH_REF=BR-PS{PS:QD}I:Err-I_Ref, CH_TOL=BR-PS{PS:QD}I:Err_I_Tol-SP, CH_ARCH=BR-PS{PS:QD}I:Err_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}I:Err_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}I:Err_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}I:Err_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}I:Err_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}I:Err_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I:Err-I, CH_REF=BR-PS{PS:QD}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:QD}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I:Err_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}I:Err-I, CH_REF=BR-PS{PS:QD}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:QD}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}I:Err_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QD}E:DAC2-I, CH_REF=BR-PS{PS:QD}E:DAC2-I_Ref, CH_TOL=BR-PS{PS:QD}E:DAC2_I_Tol-SP, CH_ARCH=BR-PS{PS:QD}E:DAC2_I_Arch-I, CH_DIFFREF=BR-PS{PS:QD}E:DAC2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QD}E:DAC2_I_DiffArch-I, CH_FLG=BR-PS{PS:QD}E:DAC2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}E:DAC2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QD}E:DAC2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}E:DAC2-I, CH_REF=BR-PS{PS:QD}E:DAC2-I_Ref, CH_DIFFREF=BR-PS{PS:QD}E:DAC2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}E:DAC2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QD}E:DAC2-I, CH_REF=BR-PS{PS:QD}E:DAC2-I_Ref, CH_DIFFREF=BR-PS{PS:QD}E:DAC2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}E:DAC2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QD}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR-PS{PS:QD}Cmd:RstErr_Arch-Sts, CH_FLG=BR-PS{PS:QD}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QD}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:QD}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QD}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:QD}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QD}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR-PS{PS:QD}Cmd:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:QD}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QD}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:QD}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QD}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:QD}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QD}Sts:Rdy-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Sts:Rdy_Arch-Sts, CH_FLG=BR-PS{PS:QD}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QD}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QD}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QD}Sts:PwrOn-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Sts:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:QD}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QD}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QD}Cmd:PwrOn-Cmd, CH_FLG=BR-PS{PS:QD}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=1")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QD}Sts:ChargCircBreaker-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Sts:ChargCircBreaker_Arch-Sts, CH_FLG=BR-PS{PS:QD}Sts:ChargCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Sts:ChargCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QD}Sts:ChargCircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:ChargCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:ChargCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QD}Sts:ChargCircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:ChargCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:ChargCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QD}Sts:ChargRdy-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Sts:ChargRdy_Arch-Sts, CH_FLG=BR-PS{PS:QD}Sts:ChargRdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Sts:ChargRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QD}Sts:ChargRdy-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:ChargRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:ChargRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QD}Sts:ChargRdy-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:ChargRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:ChargRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QD}Flt:RegOvrload-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Flt:RegOvrload_Arch-Sts, CH_FLG=BR-PS{PS:QD}Flt:RegOvrload_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Flt:RegOvrload_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QD}Flt:RegOvrload-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:RegOvrload_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:RegOvrload_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QD}Flt:RegOvrload-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:RegOvrload_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:RegOvrload_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QD}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR-PS{PS:QD}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QD}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QD}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QD}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Flt:PSovrheat_Arch-Sts, CH_FLG=BR-PS{PS:QD}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QD}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QD}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Flt:Driver-Sts, CH_REF=BR-PS{PS:QD}Flt:Driver-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Flt:Driver_Arch-Sts, CH_FLG=BR-PS{PS:QD}Flt:Driver_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Flt:Driver_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:Driver-Sts, CH_REF=BR-PS{PS:QD}Flt:Driver-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:Driver_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:Driver-Sts, CH_REF=BR-PS{PS:QD}Flt:Driver-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:Driver_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QD}Flt:DCCT-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Flt:DCCT_Arch-Sts, CH_FLG=BR-PS{PS:QD}Flt:DCCT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Flt:DCCT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QD}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:DCCT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QD}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:QD}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Flt:DCCT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QD}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR-PS{PS:QD}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QD}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QD}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QD}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QD}Sts:PSwater-Sts_Ref, CH_ARCH=BR-PS{PS:QD}Sts:PSwater_Arch-Sts, CH_FLG=BR-PS{PS:QD}Sts:PSwater_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QD}Sts:PSwater_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QD}Sts:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:PSwater_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QD}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QD}Sts:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:QD}Sts:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QD}Sts:PSwater_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR-PS{PS:QG} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:QG}I-SP,              OUTPUT=BR{PSC06}DAC:0-SP,    WF_LENGTH=10150")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:QG}E:FdFwd-SP,        OUTPUT=BR{PSC06}DAC:1-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:00-I,          OUTPUT=BR-PS{PS:QG}I:DAC_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:01-I,          OUTPUT=BR-PS{PS:QG}I_Raw-I,         WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:02-I,          OUTPUT=BR-PS{PS:QG}I:DCCT2_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:03-I,          OUTPUT=BR-PS{PS:QG}I:PSinput_Raw-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:04-I,          OUTPUT=BR-PS{PS:QG}T:PS_Raw-I,      WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:05-I,          OUTPUT=BR-PS{PS:QG}E:PSinput_Raw-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:06-I,          OUTPUT=BR-PS{PS:QG}E:PSoutput_Raw-I,WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:07-I,          OUTPUT=BR-PS{PS:QG}I:Err_Raw-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC06}ADC:08-I,          OUTPUT=BR-PS{PS:QG}E:DAC2_Raw-I,    WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:QG}Cmd:RstErr-Cmd,    OUTPUT=BR{PSC06}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:QG}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC06}DO:1-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:00-Sts,         OUTPUT=BR-PS{PS:QG}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:01-Sts,         OUTPUT=BR-PS{PS:QG}Sts:PwrOn-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:02-Sts,         OUTPUT=BR-PS{PS:QG}Sts:ChargCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:03-Sts,         OUTPUT=BR-PS{PS:QG}Sts:ChargRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:08-Sts,         OUTPUT=BR-PS{PS:QG}Flt:RegOvrload-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:09-Sts,         OUTPUT=BR-PS{PS:QG}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:10-Sts,         OUTPUT=BR-PS{PS:QG}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:11-Sts,         OUTPUT=BR-PS{PS:QG}Flt:Driver-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:12-Sts,         OUTPUT=BR-PS{PS:QG}Flt:DCCT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:14-Sts,         OUTPUT=BR-PS{PS:QG}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC06}DI:15-Sts,         OUTPUT=BR-PS{PS:QG}Sts:PSwater-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:QG}I-SP, OUTPUT=BR-PS{PS:QG}I_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:QG}E:FdFwd-SP, OUTPUT=BR-PS{PS:QG}E:FdFwd_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}I_Raw-SP-1k,   OUTPUT=BR-PS{PS:QG}I-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I-SP-1k,       INDEX=BR-PS{PS:QG}I-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}I-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I-SP-1k,       INDEX=BR-PS{PS:QG}I-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}I-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I-SP-1k,       INDEX=BR-PS{PS:QG}I-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}I-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}E:FdFwd_Raw-SP-1k, OUTPUT=BR-PS{PS:QG}E:FdFwd-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QG}E:FdFwd-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}E:FdFwd-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QG}E:FdFwd-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}E:FdFwd-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:FdFwd-SP-1k,       INDEX=BR-PS{PS:QG}E:FdFwd-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}E:FdFwd-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}I:DAC_Raw-I,   OUTPUT=BR-PS{PS:QG}I:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:DAC-I,       INDEX=BR-PS{PS:QG}I:DAC-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}I:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:DAC-I,       INDEX=BR-PS{PS:QG}I:DAC-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}I:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:DAC-I,       INDEX=BR-PS{PS:QG}I:DAC-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}I:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}I_Raw-I,   OUTPUT=BR-PS{PS:QG}I-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I-I,       INDEX=BR-PS{PS:QG}I-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}I-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I-I,       INDEX=BR-PS{PS:QG}I-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}I-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I-I,       INDEX=BR-PS{PS:QG}I-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}I-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}I:DCCT2_Raw-I, OUTPUT=BR-PS{PS:QG}I:DCCT2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:DCCT2-I,     INDEX=BR-PS{PS:QG}I:DCCT2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}I:DCCT2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:DCCT2-I,     INDEX=BR-PS{PS:QG}I:DCCT2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}I:DCCT2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:DCCT2-I,     INDEX=BR-PS{PS:QG}I:DCCT2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}I:DCCT2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}I:PSinput_Raw-I,     OUTPUT=BR-PS{PS:QG}I:PSinput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:PSinput-I,       INDEX=BR-PS{PS:QG}I:PSinput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}I:PSinput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:PSinput-I,       INDEX=BR-PS{PS:QG}I:PSinput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}I:PSinput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:PSinput-I,       INDEX=BR-PS{PS:QG}I:PSinput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}I:PSinput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}T:PS_Raw-I,     OUTPUT=BR-PS{PS:QG}T:PS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}T:PS-I,       INDEX=BR-PS{PS:QG}T:PS-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}T:PS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}T:PS-I,       INDEX=BR-PS{PS:QG}T:PS-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}T:PS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}T:PS-I,       INDEX=BR-PS{PS:QG}T:PS-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}T:PS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}E:PSinput_Raw-I,     OUTPUT=BR-PS{PS:QG}E:PSinput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:PSinput-I,       INDEX=BR-PS{PS:QG}E:PSinput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}E:PSinput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:PSinput-I,       INDEX=BR-PS{PS:QG}E:PSinput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}E:PSinput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:PSinput-I,       INDEX=BR-PS{PS:QG}E:PSinput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}E:PSinput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}E:PSoutput_Raw-I,     OUTPUT=BR-PS{PS:QG}E:PSoutput-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:PSoutput-I,       INDEX=BR-PS{PS:QG}E:PSoutput-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}E:PSoutput-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:PSoutput-I,       INDEX=BR-PS{PS:QG}E:PSoutput-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}E:PSoutput-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:PSoutput-I,       INDEX=BR-PS{PS:QG}E:PSoutput-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}E:PSoutput-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}I:Err_Raw-I,   OUTPUT=BR-PS{PS:QG}I:Err-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:Err-I,       INDEX=BR-PS{PS:QG}I:Err-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}I:Err-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:Err-I,       INDEX=BR-PS{PS:QG}I:Err-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}I:Err-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}I:Err-I,       INDEX=BR-PS{PS:QG}I:Err-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}I:Err-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:QG}E:DAC2_Raw-I,     OUTPUT=BR-PS{PS:QG}E:DAC2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:DAC2-I,       INDEX=BR-PS{PS:QG}E:DAC2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:QG}E:DAC2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:DAC2-I,       INDEX=BR-PS{PS:QG}E:DAC2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:QG}E:DAC2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:QG}E:DAC2-I,       INDEX=BR-PS{PS:QG}E:DAC2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:QG}E:DAC2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}I-SP, CH_REF=BR-PS{PS:QG}I-SP_Ref, CH_TOL=BR-PS{PS:QG}I_SP_Tol-SP, CH_ARCH=BR-PS{PS:QG}I_SP_Arch-I, CH_DIFFREF=BR-PS{PS:QG}I_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}I_SP_DiffArch-I, CH_FLG=BR-PS{PS:QG}I_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}I_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}I_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I-SP, CH_REF=BR-PS{PS:QG}I-SP_Ref, CH_DIFFREF=BR-PS{PS:QG}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I-SP, CH_REF=BR-PS{PS:QG}I-SP_Ref, CH_DIFFREF=BR-PS{PS:QG}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}E:FdFwd-SP, CH_REF=BR-PS{PS:QG}E:FdFwd-SP_Ref, CH_TOL=BR-PS{PS:QG}E:FdFwd_SP_Tol-SP, CH_ARCH=BR-PS{PS:QG}E:FdFwd_SP_Arch-I, CH_DIFFREF=BR-PS{PS:QG}E:FdFwd_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}E:FdFwd_SP_DiffArch-I, CH_FLG=BR-PS{PS:QG}E:FdFwd_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}E:FdFwd_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}E:FdFwd_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}E:FdFwd-SP, CH_REF=BR-PS{PS:QG}E:FdFwd-SP_Ref, CH_DIFFREF=BR-PS{PS:QG}E:FdFwd_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}E:FdFwd_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}E:FdFwd-SP, CH_REF=BR-PS{PS:QG}E:FdFwd-SP_Ref, CH_DIFFREF=BR-PS{PS:QG}E:FdFwd_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}E:FdFwd_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}I:DAC-I, CH_REF=BR-PS{PS:QG}I:DAC-I_Ref, CH_TOL=BR-PS{PS:QG}I:DAC_I_Tol-SP,  CH_ARCH=BR-PS{PS:QG}I:DAC_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}I:DAC_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}I:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}I:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I:DAC-I, CH_REF=BR-PS{PS:QG}I:DAC-I_Ref, CH_DIFFREF=BR-PS{PS:QG}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I:DAC-I, CH_REF=BR-PS{PS:QG}I-SP-1k, CH_DIFFREF=BR-PS{PS:QG}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}I-I, CH_REF=BR-PS{PS:QG}I-I_Ref, CH_TOL=BR-PS{PS:QG}I_I_Tol-SP, CH_ARCH=BR-PS{PS:QG}I_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}I_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}I_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}I_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}I_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}I_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I-I, CH_REF=BR-PS{PS:QG}I-I_Ref, CH_DIFFREF=BR-PS{PS:QG}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I-I, CH_REF=BR-PS{PS:QG}I-SP-1k, CH_DIFFREF=BR-PS{PS:QG}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}I:DCCT2-I, CH_REF=BR-PS{PS:QG}I:DCCT2-I_Ref, CH_TOL=BR-PS{PS:QG}I:DCCT2_I_Tol-SP, CH_ARCH=BR-PS{PS:QG}I:DCCT2_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}I:DCCT2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}I:DCCT2_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}I:DCCT2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}I:DCCT2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}I:DCCT2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I:DCCT2-I, CH_REF=BR-PS{PS:QG}I:DCCT2-I_Ref, CH_DIFFREF=BR-PS{PS:QG}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I:DCCT2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I:DCCT2-I, CH_REF=BR-PS{PS:QG}I-SP-1k, CH_DIFFREF=BR-PS{PS:QG}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I:DCCT2_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}I:PSinput-I, CH_REF=BR-PS{PS:QG}I:PSinput-I_Ref, CH_TOL=BR-PS{PS:QG}I:PSinput_I_Tol-SP, CH_ARCH=BR-PS{PS:QG}I:PSinput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}I:PSinput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}I:PSinput_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}I:PSinput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}I:PSinput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}I:PSinput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I:PSinput-I, CH_REF=BR-PS{PS:QG}I:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QG}I:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I:PSinput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I:PSinput-I, CH_REF=BR-PS{PS:QG}I:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QG}I:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I:PSinput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}T:PS-I, CH_REF=BR-PS{PS:QG}T:PS-I_Ref, CH_TOL=BR-PS{PS:QG}T:PS_I_Tol-SP, CH_ARCH=BR-PS{PS:QG}T:PS_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}T:PS_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}T:PS_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}T:PS_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}T:PS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}T:PS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}T:PS-I, CH_REF=BR-PS{PS:QG}T:PS-I_Ref, CH_DIFFREF=BR-PS{PS:QG}T:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}T:PS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}T:PS-I, CH_REF=BR-PS{PS:QG}T:PS-I_Ref, CH_DIFFREF=BR-PS{PS:QG}T:PS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}T:PS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}E:PSinput-I, CH_REF=BR-PS{PS:QG}E:PSinput-I_Ref, CH_TOL=BR-PS{PS:QG}E:PSinput_I_Tol-SP, CH_ARCH=BR-PS{PS:QG}E:PSinput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}E:PSinput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}E:PSinput_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}E:PSinput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}E:PSinput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}E:PSinput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}E:PSinput-I, CH_REF=BR-PS{PS:QG}E:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QG}E:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}E:PSinput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}E:PSinput-I, CH_REF=BR-PS{PS:QG}E:PSinput-I_Ref, CH_DIFFREF=BR-PS{PS:QG}E:PSinput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}E:PSinput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}E:PSoutput-I, CH_REF=BR-PS{PS:QG}E:PSoutput-I_Ref, CH_TOL=BR-PS{PS:QG}E:PSoutput_I_Tol-SP, CH_ARCH=BR-PS{PS:QG}E:PSoutput_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}E:PSoutput_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}E:PSoutput_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}E:PSoutput_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}E:PSoutput_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}E:PSoutput_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}E:PSoutput-I, CH_REF=BR-PS{PS:QG}E:PSoutput-I_Ref, CH_DIFFREF=BR-PS{PS:QG}E:PSoutput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}E:PSoutput_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}E:PSoutput-I, CH_REF=BR-PS{PS:QG}E:PSoutput-I_Ref, CH_DIFFREF=BR-PS{PS:QG}E:PSoutput_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}E:PSoutput_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}I:Err-I, CH_REF=BR-PS{PS:QG}I:Err-I_Ref, CH_TOL=BR-PS{PS:QG}I:Err_I_Tol-SP, CH_ARCH=BR-PS{PS:QG}I:Err_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}I:Err_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}I:Err_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}I:Err_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}I:Err_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}I:Err_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I:Err-I, CH_REF=BR-PS{PS:QG}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:QG}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I:Err_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}I:Err-I, CH_REF=BR-PS{PS:QG}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:QG}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}I:Err_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:QG}E:DAC2-I, CH_REF=BR-PS{PS:QG}E:DAC2-I_Ref, CH_TOL=BR-PS{PS:QG}E:DAC2_I_Tol-SP, CH_ARCH=BR-PS{PS:QG}E:DAC2_I_Arch-I, CH_DIFFREF=BR-PS{PS:QG}E:DAC2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:QG}E:DAC2_I_DiffArch-I, CH_FLG=BR-PS{PS:QG}E:DAC2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}E:DAC2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR-PS{PS:QG}E:DAC2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}E:DAC2-I, CH_REF=BR-PS{PS:QG}E:DAC2-I_Ref, CH_DIFFREF=BR-PS{PS:QG}E:DAC2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}E:DAC2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:QG}E:DAC2-I, CH_REF=BR-PS{PS:QG}E:DAC2-I_Ref, CH_DIFFREF=BR-PS{PS:QG}E:DAC2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}E:DAC2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QG}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR-PS{PS:QG}Cmd:RstErr_Arch-Sts, CH_FLG=BR-PS{PS:QG}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QG}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:QG}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:QG}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:QG}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QG}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR-PS{PS:QG}Cmd:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:QG}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QG}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:QG}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:QG}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:QG}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QG}Sts:Rdy-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Sts:Rdy_Arch-Sts, CH_FLG=BR-PS{PS:QG}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QG}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:Rdy-Sts, CH_REF=BR-PS{PS:QG}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QG}Sts:PwrOn-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Sts:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:QG}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QG}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:QG}Cmd:PwrOn-Cmd, CH_FLG=BR-PS{PS:QG}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=1")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QG}Sts:ChargCircBreaker-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Sts:ChargCircBreaker_Arch-Sts, CH_FLG=BR-PS{PS:QG}Sts:ChargCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Sts:ChargCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QG}Sts:ChargCircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:ChargCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:ChargCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:ChargCircBreaker-Sts, CH_REF=BR-PS{PS:QG}Sts:ChargCircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:ChargCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:ChargCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QG}Sts:ChargRdy-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Sts:ChargRdy_Arch-Sts, CH_FLG=BR-PS{PS:QG}Sts:ChargRdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Sts:ChargRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QG}Sts:ChargRdy-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:ChargRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:ChargRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:ChargRdy-Sts, CH_REF=BR-PS{PS:QG}Sts:ChargRdy-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:ChargRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:ChargRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QG}Flt:RegOvrload-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Flt:RegOvrload_Arch-Sts, CH_FLG=BR-PS{PS:QG}Flt:RegOvrload_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Flt:RegOvrload_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QG}Flt:RegOvrload-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:RegOvrload_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:RegOvrload_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:RegOvrload-Sts, CH_REF=BR-PS{PS:QG}Flt:RegOvrload-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:RegOvrload_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:RegOvrload_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QG}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR-PS{PS:QG}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QG}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:QG}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QG}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Flt:PSovrheat_Arch-Sts, CH_FLG=BR-PS{PS:QG}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QG}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:QG}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Flt:Driver-Sts, CH_REF=BR-PS{PS:QG}Flt:Driver-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Flt:Driver_Arch-Sts, CH_FLG=BR-PS{PS:QG}Flt:Driver_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Flt:Driver_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:Driver-Sts, CH_REF=BR-PS{PS:QG}Flt:Driver-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:Driver_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:Driver-Sts, CH_REF=BR-PS{PS:QG}Flt:Driver-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:Driver_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:Driver_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QG}Flt:DCCT-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Flt:DCCT_Arch-Sts, CH_FLG=BR-PS{PS:QG}Flt:DCCT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Flt:DCCT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QG}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:DCCT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Flt:DCCT-Sts, CH_REF=BR-PS{PS:QG}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:QG}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Flt:DCCT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QG}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR-PS{PS:QG}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QG}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:ExtInterlock-Sts, CH_REF=BR-PS{PS:QG}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:QG}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QG}Sts:PSwater-Sts_Ref, CH_ARCH=BR-PS{PS:QG}Sts:PSwater_Arch-Sts, CH_FLG=BR-PS{PS:QG}Sts:PSwater_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:QG}Sts:PSwater_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QG}Sts:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:PSwater_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:QG}Sts:PSwater-Sts, CH_REF=BR-PS{PS:QG}Sts:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:QG}Sts:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:QG}Sts:PSwater_MonitFlg-Sts, MODE=1, ENABLED=0")


var(PSCDebug, 1)
#with debug message: var(PSCDebug, 2)

#Tx socket
createPSC("TxPSC04", "br-psc04", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC04", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC04", "br-psc04", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC04", 80, 128)

#Tx socket
createPSC("TxPSC05", "br-psc05", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC05", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC05", "br-psc05", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC05", 80, 128)

#Tx socket
createPSC("TxPSC06", "br-psc06", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC06", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC06", "br-psc06", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC06", 80, 128)

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

