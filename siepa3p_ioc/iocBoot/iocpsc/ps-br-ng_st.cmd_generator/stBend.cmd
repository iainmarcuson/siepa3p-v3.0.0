#!../../bin/linux-x86/psc

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
epicsEnvSet("EPICS_CA_ADDR_LIST","10.0.153.255")
epicsEnvSet("IOCNAME", "ps-br-bend-ng")

#epicsThreadSleep 5

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/psc.dbd",0,0)
psc_registerRecordDeviceDriver(pdbbase)

## Load record instances


dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC01")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC01")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC01, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:00_Raw-I,  OUTPUT=BR{PSC01}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:01_Raw-I,  OUTPUT=BR{PSC01}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:02_Raw-I,  OUTPUT=BR{PSC01}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:03_Raw-I,  OUTPUT=BR{PSC01}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:04_Raw-I,  OUTPUT=BR{PSC01}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:05_Raw-I,  OUTPUT=BR{PSC01}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:06_Raw-I,  OUTPUT=BR{PSC01}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:07_Raw-I,  OUTPUT=BR{PSC01}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:08_Raw-I,  OUTPUT=BR{PSC01}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:09_Raw-I,  OUTPUT=BR{PSC01}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:10_Raw-I,  OUTPUT=BR{PSC01}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:11_Raw-I,  OUTPUT=BR{PSC01}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:12_Raw-I,  OUTPUT=BR{PSC01}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:13_Raw-I,  OUTPUT=BR{PSC01}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:14_Raw-I,  OUTPUT=BR{PSC01}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:15_Raw-I,  OUTPUT=BR{PSC01}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:16_Raw-I,  OUTPUT=BR{PSC01}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:17_Raw-I,  OUTPUT=BR{PSC01}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC01}ADC10k:0_Raw-I,  OUTPUT=BR{PSC01}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC01}ADC10k:1_Raw-I,  OUTPUT=BR{PSC01}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC01}ADC10k:0-I, INPUT2=BR{PSC01}ADC10k:1-I, OUTPUT=BR{PSC01}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC01}ADC10k:0_Raw-I,  OUTPUT=BR{PSC01}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC01}ADC10k:1_Raw-I,  OUTPUT=BR{PSC01}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC01, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}Bend_Delta-SP, DELTA_STEPS=BR-PS{}Bend_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC01}DAC:0-SP,         OUTPUT=BR{PSC01}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC01}DAC:0_Raw-SP,     OUTPUT=BR{PSC01}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC01}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC01}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC01, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}Bend_Delta-SP, DELTA_STEPS=BR-PS{}Bend_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC01}DAC:1-SP,         OUTPUT=BR{PSC01}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC01}DAC:1_Raw-SP,     OUTPUT=BR{PSC01}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC01}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC01}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC02")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC02")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC02, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:00_Raw-I,  OUTPUT=BR{PSC02}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:01_Raw-I,  OUTPUT=BR{PSC02}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:02_Raw-I,  OUTPUT=BR{PSC02}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:03_Raw-I,  OUTPUT=BR{PSC02}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:04_Raw-I,  OUTPUT=BR{PSC02}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:05_Raw-I,  OUTPUT=BR{PSC02}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:06_Raw-I,  OUTPUT=BR{PSC02}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:07_Raw-I,  OUTPUT=BR{PSC02}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:08_Raw-I,  OUTPUT=BR{PSC02}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:09_Raw-I,  OUTPUT=BR{PSC02}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:10_Raw-I,  OUTPUT=BR{PSC02}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:11_Raw-I,  OUTPUT=BR{PSC02}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:12_Raw-I,  OUTPUT=BR{PSC02}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:13_Raw-I,  OUTPUT=BR{PSC02}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:14_Raw-I,  OUTPUT=BR{PSC02}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:15_Raw-I,  OUTPUT=BR{PSC02}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:16_Raw-I,  OUTPUT=BR{PSC02}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:17_Raw-I,  OUTPUT=BR{PSC02}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC02}ADC10k:0_Raw-I,  OUTPUT=BR{PSC02}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC02}ADC10k:1_Raw-I,  OUTPUT=BR{PSC02}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC02}ADC10k:0-I, INPUT2=BR{PSC02}ADC10k:1-I, OUTPUT=BR{PSC02}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC02}ADC10k:0_Raw-I,  OUTPUT=BR{PSC02}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC02}ADC10k:1_Raw-I,  OUTPUT=BR{PSC02}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC02, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}Bend_Delta-SP, DELTA_STEPS=BR-PS{}Bend_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC02}DAC:0-SP,         OUTPUT=BR{PSC02}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC02}DAC:0_Raw-SP,     OUTPUT=BR{PSC02}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC02}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC02}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC02, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}Bend_Delta-SP, DELTA_STEPS=BR-PS{}Bend_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC02}DAC:1-SP,         OUTPUT=BR{PSC02}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC02}DAC:1_Raw-SP,     OUTPUT=BR{PSC02}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC02}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC02}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC03")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC03")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC03, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:00_Raw-I,  OUTPUT=BR{PSC03}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:01_Raw-I,  OUTPUT=BR{PSC03}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:02_Raw-I,  OUTPUT=BR{PSC03}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:03_Raw-I,  OUTPUT=BR{PSC03}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:04_Raw-I,  OUTPUT=BR{PSC03}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:05_Raw-I,  OUTPUT=BR{PSC03}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:06_Raw-I,  OUTPUT=BR{PSC03}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:07_Raw-I,  OUTPUT=BR{PSC03}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:08_Raw-I,  OUTPUT=BR{PSC03}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:09_Raw-I,  OUTPUT=BR{PSC03}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:10_Raw-I,  OUTPUT=BR{PSC03}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:11_Raw-I,  OUTPUT=BR{PSC03}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:12_Raw-I,  OUTPUT=BR{PSC03}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:13_Raw-I,  OUTPUT=BR{PSC03}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:14_Raw-I,  OUTPUT=BR{PSC03}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:15_Raw-I,  OUTPUT=BR{PSC03}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:16_Raw-I,  OUTPUT=BR{PSC03}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:17_Raw-I,  OUTPUT=BR{PSC03}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC03}ADC10k:0_Raw-I,  OUTPUT=BR{PSC03}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC03}ADC10k:1_Raw-I,  OUTPUT=BR{PSC03}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC03}ADC10k:0-I, INPUT2=BR{PSC03}ADC10k:1-I, OUTPUT=BR{PSC03}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC03}ADC10k:0_Raw-I,  OUTPUT=BR{PSC03}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC03}ADC10k:1_Raw-I,  OUTPUT=BR{PSC03}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC03, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}Bend_Delta-SP, DELTA_STEPS=BR-PS{}Bend_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC03}DAC:0-SP,         OUTPUT=BR{PSC03}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC03}DAC:0_Raw-SP,     OUTPUT=BR{PSC03}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC03}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC03}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC03, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}Bend_Delta-SP, DELTA_STEPS=BR-PS{}Bend_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC03}DAC:1-SP,         OUTPUT=BR{PSC03}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC03}DAC:1_Raw-SP,     OUTPUT=BR{PSC03}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC03}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC03}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

# BR-PS{PS:BD1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:BD1}I-SP,              OUTPUT=BR{PSC01}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:01-I,          OUTPUT=BR-PS{PS:BD1}I_Raw-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:16-I,          OUTPUT=BR-PS{PS:BD1}I:DCCT2_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:02-I,          OUTPUT=BR-PS{PS:BD1}I:Err_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:03-I,          OUTPUT=BR-PS{PS:BD1}E:PSout_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:04-I,          OUTPUT=BR-PS{PS:BD1}I:GND_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:05-I,          OUTPUT=BR-PS{PS:BD1}E:BankH_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:06-I,          OUTPUT=BR-PS{PS:BD1}I:BankH_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:09-I,          OUTPUT=BR-PS{PS:BD1}I:DAC_Raw-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:10-I,          OUTPUT=BR-PS{PS:BD1}E:BankL_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC01}ADC:11-I,          OUTPUT=BR-PS{PS:BD1}I:BankL_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BD1}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC01}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BD1}Cmd:PwrOff-Cmd,    OUTPUT=BR{PSC01}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BD1}Cmd:RstErr-Cmd,    OUTPUT=BR{PSC01}DO:3-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:00-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:DCCT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:01-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:IGBT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:02-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:AcPhase-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:03-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:PSwater-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:04-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:05-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:Regulator-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:06-Sts,         OUTPUT=BR-PS{PS:BD1}Sts:CircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:07-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:08-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:Loadovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:09-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:BankFuse-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:10-Sts,         OUTPUT=BR-PS{PS:BD1}Sts:RmtCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:11-Sts,         OUTPUT=BR-PS{PS:BD1}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:12-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:GNDleak-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:13-Sts,         OUTPUT=BR-PS{PS:BD1}Flt:DoorEmergButt-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:14-Sts,         OUTPUT=BR-PS{PS:BD1}Sts:SumInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC01}DI:15-Sts,         OUTPUT=BR-PS{PS:BD1}Sts:PwrOn-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:BD1}I-SP,      OUTPUT=BR-PS{PS:BD1}I_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}I_Raw-SP-1k,   OUTPUT=BR-PS{PS:BD1}I-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I-SP-1k,       INDEX=BR-PS{PS:BD1}I-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}I-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I-SP-1k,       INDEX=BR-PS{PS:BD1}I-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}I-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I-SP-1k,       INDEX=BR-PS{PS:BD1}I-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}I-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}I_Raw-I,   OUTPUT=BR-PS{PS:BD1}I-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I-I,       INDEX=BR-PS{PS:BD1}I-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}I-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I-I,       INDEX=BR-PS{PS:BD1}I-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}I-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I-I,       INDEX=BR-PS{PS:BD1}I-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}I-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}I:DCCT2_Raw-I, OUTPUT=BR-PS{PS:BD1}I:DCCT2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:DCCT2-I,     INDEX=BR-PS{PS:BD1}I:DCCT2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}I:DCCT2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:DCCT2-I,     INDEX=BR-PS{PS:BD1}I:DCCT2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}I:DCCT2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:DCCT2-I,     INDEX=BR-PS{PS:BD1}I:DCCT2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}I:DCCT2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}I:Err_Raw-I,   OUTPUT=BR-PS{PS:BD1}I:Err-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:Err-I,       INDEX=BR-PS{PS:BD1}I:Err-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}I:Err-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:Err-I,       INDEX=BR-PS{PS:BD1}I:Err-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}I:Err-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:Err-I,       INDEX=BR-PS{PS:BD1}I:Err-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}I:Err-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}E:PSout_Raw-I,   OUTPUT=BR-PS{PS:BD1}E:PSout-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:PSout-I,       INDEX=BR-PS{PS:BD1}E:PSout-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}E:PSout-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:PSout-I,       INDEX=BR-PS{PS:BD1}E:PSout-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}E:PSout-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:PSout-I,       INDEX=BR-PS{PS:BD1}E:PSout-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}E:PSout-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}I:GND_Raw-I,   OUTPUT=BR-PS{PS:BD1}I:GND-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:GND-I,       INDEX=BR-PS{PS:BD1}I:GND-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}I:GND-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:GND-I,       INDEX=BR-PS{PS:BD1}I:GND-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}I:GND-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:GND-I,       INDEX=BR-PS{PS:BD1}I:GND-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}I:GND-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}E:BankH_Raw-I,   OUTPUT=BR-PS{PS:BD1}E:BankH-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:BankH-I,       INDEX=BR-PS{PS:BD1}E:BankH-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}E:BankH-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:BankH-I,       INDEX=BR-PS{PS:BD1}E:BankH-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}E:BankH-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:BankH-I,       INDEX=BR-PS{PS:BD1}E:BankH-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}E:BankH-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}I:BankH_Raw-I,   OUTPUT=BR-PS{PS:BD1}I:BankH-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:BankH-I,       INDEX=BR-PS{PS:BD1}I:BankH-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}I:BankH-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:BankH-I,       INDEX=BR-PS{PS:BD1}I:BankH-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}I:BankH-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:BankH-I,       INDEX=BR-PS{PS:BD1}I:BankH-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}I:BankH-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}I:DAC_Raw-I,   OUTPUT=BR-PS{PS:BD1}I:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:DAC-I,       INDEX=BR-PS{PS:BD1}I:DAC-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}I:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:DAC-I,       INDEX=BR-PS{PS:BD1}I:DAC-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}I:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:DAC-I,       INDEX=BR-PS{PS:BD1}I:DAC-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}I:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}E:BankL_Raw-I,   OUTPUT=BR-PS{PS:BD1}E:BankL-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:BankL-I,       INDEX=BR-PS{PS:BD1}E:BankL-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}E:BankL-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:BankL-I,       INDEX=BR-PS{PS:BD1}E:BankL-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}E:BankL-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}E:BankL-I,       INDEX=BR-PS{PS:BD1}E:BankL-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}E:BankL-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD1}I:BankL_Raw-I,   OUTPUT=BR-PS{PS:BD1}I:BankL-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:BankL-I,       INDEX=BR-PS{PS:BD1}I:BankL-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD1}I:BankL-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:BankL-I,       INDEX=BR-PS{PS:BD1}I:BankL-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD1}I:BankL-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD1}I:BankL-I,       INDEX=BR-PS{PS:BD1}I:BankL-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD1}I:BankL-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}I-SP, CH_REF=BR-PS{PS:BD1}I-SP_Ref, CH_TOL=BR-PS{PS:BD1}I_SP_Tol-SP, CH_ARCH=BR-PS{PS:BD1}I_SP_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}I_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}I_SP_DiffArch-I, CH_FLG=BR-PS{PS:BD1}I_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}I_SP_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}I_SP_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I-SP, CH_REF=BR-PS{PS:BD1}I-SP_Ref, CH_DIFFREF=BR-PS{PS:BD1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I-SP, CH_REF=BR-PS{PS:BD1}I-SP_Ref, CH_DIFFREF=BR-PS{PS:BD1}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}I-I, CH_REF=BR-PS{PS:BD1}I-I_Ref, CH_TOL=BR-PS{PS:BD1}I_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}I_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}I_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}I_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}I_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}I_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}I_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I-I, CH_REF=BR-PS{PS:BD1}I-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I-I, CH_REF=BR-PS{PS:BD1}I-SP-1k, CH_DIFFREF=BR-PS{PS:BD1}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}I:DCCT2-I, CH_REF=BR-PS{PS:BD1}I:DCCT2-I_Ref, CH_TOL=BR-PS{PS:BD1}I:DCCT2_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}I:DCCT2_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}I:DCCT2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}I:DCCT2_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}I:DCCT2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}I:DCCT2_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}I:DCCT2_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:DCCT2-I, CH_REF=BR-PS{PS:BD1}I:DCCT2-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:DCCT2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:DCCT2-I, CH_REF=BR-PS{PS:BD1}I-SP-1k, CH_DIFFREF=BR-PS{PS:BD1}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:DCCT2_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}I:Err-I, CH_REF=BR-PS{PS:BD1}I:Err-I_Ref, CH_TOL=BR-PS{PS:BD1}I:Err_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}I:Err_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}I:Err_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}I:Err_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}I:Err_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}I:Err_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}I:Err_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:Err-I, CH_REF=BR-PS{PS:BD1}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:Err_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:Err-I, CH_REF=BR-PS{PS:BD1}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:Err_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}E:PSout-I, CH_REF=BR-PS{PS:BD1}E:PSout-I_Ref, CH_TOL=BR-PS{PS:BD1}E:PSout_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}E:PSout_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}E:PSout_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}E:PSout_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}E:PSout_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}E:PSout_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}E:PSout_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}E:PSout-I, CH_REF=BR-PS{PS:BD1}E:PSout-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}E:PSout_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}E:PSout_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}E:PSout-I, CH_REF=BR-PS{PS:BD1}E:PSout-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}E:PSout_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}E:PSout_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}I:GND-I, CH_REF=BR-PS{PS:BD1}I:GND-I_Ref, CH_TOL=BR-PS{PS:BD1}I:GND_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}I:GND_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}I:GND_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}I:GND_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}I:GND_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}I:GND_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}I:GND_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:GND-I, CH_REF=BR-PS{PS:BD1}I:GND-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:GND_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:GND_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:GND-I, CH_REF=BR-PS{PS:BD1}I:GND-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:GND_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:GND_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}E:BankH-I, CH_REF=BR-PS{PS:BD1}E:BankH-I_Ref, CH_TOL=BR-PS{PS:BD1}E:BankH_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}E:BankH_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}E:BankH_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}E:BankH_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}E:BankH_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}E:BankH_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}E:BankH_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}E:BankH-I, CH_REF=BR-PS{PS:BD1}E:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}E:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}E:BankH_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}E:BankH-I, CH_REF=BR-PS{PS:BD1}E:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}E:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}E:BankH_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}I:BankH-I, CH_REF=BR-PS{PS:BD1}I:BankH-I_Ref, CH_TOL=BR-PS{PS:BD1}I:BankH_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}I:BankH_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}I:BankH_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}I:BankH_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}I:BankH_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}I:BankH_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}I:BankH_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:BankH-I, CH_REF=BR-PS{PS:BD1}I:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:BankH_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:BankH-I, CH_REF=BR-PS{PS:BD1}I:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:BankH_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}I:DAC-I, CH_REF=BR-PS{PS:BD1}I:DAC-I_Ref, CH_TOL=BR-PS{PS:BD1}I:DAC_I_Tol-SP,  CH_ARCH=BR-PS{PS:BD1}I:DAC_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}I:DAC_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}I:DAC_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}I:DAC_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:DAC-I, CH_REF=BR-PS{PS:BD1}I:DAC-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:DAC-I, CH_REF=BR-PS{PS:BD1}I-SP-1k, CH_DIFFREF=BR-PS{PS:BD1}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}E:BankL-I, CH_REF=BR-PS{PS:BD1}E:BankL-I_Ref, CH_TOL=BR-PS{PS:BD1}E:BankL_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}E:BankL_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}E:BankL_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}E:BankL_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}E:BankL_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}E:BankL_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}E:BankL_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}E:BankL-I, CH_REF=BR-PS{PS:BD1}E:BankL-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}E:BankL_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}E:BankL_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}E:BankL-I, CH_REF=BR-PS{PS:BD1}E:BankL-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}E:BankL_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}E:BankL_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD1}I:BankL-I, CH_REF=BR-PS{PS:BD1}I:BankL-I_Ref, CH_TOL=BR-PS{PS:BD1}I:BankL_I_Tol-SP, CH_ARCH=BR-PS{PS:BD1}I:BankL_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD1}I:BankL_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD1}I:BankL_I_DiffArch-I, CH_FLG=BR-PS{PS:BD1}I:BankL_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}I:BankL_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD1}I:BankL_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:BankL-I, CH_REF=BR-PS{PS:BD1}I:BankL-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:BankL_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:BankL_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD1}I:BankL-I, CH_REF=BR-PS{PS:BD1}I:BankL-I_Ref, CH_DIFFREF=BR-PS{PS:BD1}I:BankL_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}I:BankL_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR-PS{PS:BD1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:PwrOff-Cmd_Ref, CH_ARCH=BR-PS{PS:BD1}Cmd:PwrOff_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOff_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Cmd:PwrOff_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:PwrOff-Cmd_Ref, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOff_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOff_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:PwrOff-Cmd_Ref, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOff_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Cmd:PwrOff_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR-PS{PS:BD1}Cmd:RstErr_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:BD1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BD1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:BD1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BD1}Flt:DCCT-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:DCCT_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:DCCT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:DCCT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BD1}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:DCCT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BD1}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:DCCT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BD1}Flt:IGBT-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:IGBT_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:IGBT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:IGBT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BD1}Flt:IGBT-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:IGBT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:IGBT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BD1}Flt:IGBT-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:IGBT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:IGBT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BD1}Flt:AcPhase-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:AcPhase_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:AcPhase_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:AcPhase_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BD1}Flt:AcPhase-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:AcPhase_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:AcPhase_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BD1}Flt:AcPhase-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:AcPhase_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:AcPhase_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSwater-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:PSwater_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:PSwater_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:PSwater_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:PSwater_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:PSwater_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BD1}Flt:Regulator-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:Regulator_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:Regulator_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:Regulator_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BD1}Flt:Regulator-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:Regulator_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:Regulator_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BD1}Flt:Regulator-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:Regulator_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:Regulator_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BD1}Sts:CircBreaker-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Sts:CircBreaker_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Sts:CircBreaker_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Sts:CircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BD1}Sts:CircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:CircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:CircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BD1}Sts:CircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:CircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:CircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:PSovrheat_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BD1}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BD1}Flt:Loadovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:Loadovrheat_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:Loadovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:Loadovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BD1}Flt:Loadovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:Loadovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:Loadovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BD1}Flt:Loadovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:Loadovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:Loadovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BD1}Flt:BankFuse-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:BankFuse_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:BankFuse_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:BankFuse_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BD1}Flt:BankFuse-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:BankFuse_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:BankFuse_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BD1}Flt:BankFuse-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:BankFuse_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:BankFuse_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BD1}Sts:RmtCtrl-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Sts:RmtCtrl_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Sts:RmtCtrl_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Sts:RmtCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BD1}Sts:RmtCtrl-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:RmtCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:RmtCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BD1}Sts:RmtCtrl-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:RmtCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:RmtCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BD1}Sts:Rdy-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Sts:Rdy_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BD1}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BD1}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BD1}Flt:GNDleak-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:GNDleak_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:GNDleak_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:GNDleak_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BD1}Flt:GNDleak-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:GNDleak_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:GNDleak_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BD1}Flt:GNDleak-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:GNDleak_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:GNDleak_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BD1}Flt:DoorEmergButt-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Flt:DoorEmergButt_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Flt:DoorEmergButt_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Flt:DoorEmergButt_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BD1}Flt:DoorEmergButt-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:DoorEmergButt_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:DoorEmergButt_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BD1}Flt:DoorEmergButt-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Flt:DoorEmergButt_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Flt:DoorEmergButt_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BD1}Sts:SumInterlock-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Sts:SumInterlock_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Sts:SumInterlock_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Sts:SumInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BD1}Sts:SumInterlock-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:SumInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:SumInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BD1}Sts:SumInterlock-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:SumInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:SumInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD1}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BD1}Sts:PwrOn-Sts_Ref, CH_ARCH=BR-PS{PS:BD1}Sts:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:BD1}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD1}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BD1}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD1}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BD1}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:BD1}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD1}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR-PS{PS:BD2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:BD2}I-SP,              OUTPUT=BR{PSC02}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:01-I,          OUTPUT=BR-PS{PS:BD2}I_Raw-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:16-I,          OUTPUT=BR-PS{PS:BD2}I:DCCT2_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:02-I,          OUTPUT=BR-PS{PS:BD2}I:Err_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:03-I,          OUTPUT=BR-PS{PS:BD2}E:PSout_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:04-I,          OUTPUT=BR-PS{PS:BD2}I:GND_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:05-I,          OUTPUT=BR-PS{PS:BD2}E:BankH_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:06-I,          OUTPUT=BR-PS{PS:BD2}I:BankH_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:09-I,          OUTPUT=BR-PS{PS:BD2}I:DAC_Raw-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:10-I,          OUTPUT=BR-PS{PS:BD2}E:BankL_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC02}ADC:11-I,          OUTPUT=BR-PS{PS:BD2}I:BankL_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BD2}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC02}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BD2}Cmd:PwrOff-Cmd,    OUTPUT=BR{PSC02}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BD2}Cmd:RstErr-Cmd,    OUTPUT=BR{PSC02}DO:3-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:00-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:DCCT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:01-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:IGBT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:02-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:AcPhase-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:03-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:PSwater-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:04-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:05-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:Regulator-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:06-Sts,         OUTPUT=BR-PS{PS:BD2}Sts:CircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:07-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:08-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:Loadovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:09-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:BankFuse-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:10-Sts,         OUTPUT=BR-PS{PS:BD2}Sts:RmtCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:11-Sts,         OUTPUT=BR-PS{PS:BD2}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:12-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:GNDleak-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:13-Sts,         OUTPUT=BR-PS{PS:BD2}Flt:DoorEmergButt-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:14-Sts,         OUTPUT=BR-PS{PS:BD2}Sts:SumInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC02}DI:15-Sts,         OUTPUT=BR-PS{PS:BD2}Sts:PwrOn-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:BD2}I-SP,      OUTPUT=BR-PS{PS:BD2}I_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}I_Raw-SP-1k,   OUTPUT=BR-PS{PS:BD2}I-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I-SP-1k,       INDEX=BR-PS{PS:BD2}I-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}I-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I-SP-1k,       INDEX=BR-PS{PS:BD2}I-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}I-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I-SP-1k,       INDEX=BR-PS{PS:BD2}I-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}I-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}I_Raw-I,   OUTPUT=BR-PS{PS:BD2}I-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I-I,       INDEX=BR-PS{PS:BD2}I-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}I-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I-I,       INDEX=BR-PS{PS:BD2}I-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}I-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I-I,       INDEX=BR-PS{PS:BD2}I-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}I-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}I:DCCT2_Raw-I, OUTPUT=BR-PS{PS:BD2}I:DCCT2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:DCCT2-I,     INDEX=BR-PS{PS:BD2}I:DCCT2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}I:DCCT2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:DCCT2-I,     INDEX=BR-PS{PS:BD2}I:DCCT2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}I:DCCT2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:DCCT2-I,     INDEX=BR-PS{PS:BD2}I:DCCT2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}I:DCCT2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}I:Err_Raw-I,   OUTPUT=BR-PS{PS:BD2}I:Err-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:Err-I,       INDEX=BR-PS{PS:BD2}I:Err-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}I:Err-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:Err-I,       INDEX=BR-PS{PS:BD2}I:Err-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}I:Err-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:Err-I,       INDEX=BR-PS{PS:BD2}I:Err-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}I:Err-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}E:PSout_Raw-I,   OUTPUT=BR-PS{PS:BD2}E:PSout-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:PSout-I,       INDEX=BR-PS{PS:BD2}E:PSout-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}E:PSout-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:PSout-I,       INDEX=BR-PS{PS:BD2}E:PSout-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}E:PSout-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:PSout-I,       INDEX=BR-PS{PS:BD2}E:PSout-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}E:PSout-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}I:GND_Raw-I,   OUTPUT=BR-PS{PS:BD2}I:GND-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:GND-I,       INDEX=BR-PS{PS:BD2}I:GND-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}I:GND-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:GND-I,       INDEX=BR-PS{PS:BD2}I:GND-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}I:GND-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:GND-I,       INDEX=BR-PS{PS:BD2}I:GND-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}I:GND-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}E:BankH_Raw-I,   OUTPUT=BR-PS{PS:BD2}E:BankH-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:BankH-I,       INDEX=BR-PS{PS:BD2}E:BankH-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}E:BankH-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:BankH-I,       INDEX=BR-PS{PS:BD2}E:BankH-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}E:BankH-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:BankH-I,       INDEX=BR-PS{PS:BD2}E:BankH-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}E:BankH-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}I:BankH_Raw-I,   OUTPUT=BR-PS{PS:BD2}I:BankH-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:BankH-I,       INDEX=BR-PS{PS:BD2}I:BankH-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}I:BankH-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:BankH-I,       INDEX=BR-PS{PS:BD2}I:BankH-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}I:BankH-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:BankH-I,       INDEX=BR-PS{PS:BD2}I:BankH-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}I:BankH-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}I:DAC_Raw-I,   OUTPUT=BR-PS{PS:BD2}I:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:DAC-I,       INDEX=BR-PS{PS:BD2}I:DAC-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}I:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:DAC-I,       INDEX=BR-PS{PS:BD2}I:DAC-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}I:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:DAC-I,       INDEX=BR-PS{PS:BD2}I:DAC-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}I:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}E:BankL_Raw-I,   OUTPUT=BR-PS{PS:BD2}E:BankL-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:BankL-I,       INDEX=BR-PS{PS:BD2}E:BankL-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}E:BankL-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:BankL-I,       INDEX=BR-PS{PS:BD2}E:BankL-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}E:BankL-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}E:BankL-I,       INDEX=BR-PS{PS:BD2}E:BankL-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}E:BankL-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BD2}I:BankL_Raw-I,   OUTPUT=BR-PS{PS:BD2}I:BankL-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:BankL-I,       INDEX=BR-PS{PS:BD2}I:BankL-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BD2}I:BankL-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:BankL-I,       INDEX=BR-PS{PS:BD2}I:BankL-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BD2}I:BankL-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BD2}I:BankL-I,       INDEX=BR-PS{PS:BD2}I:BankL-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BD2}I:BankL-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}I-SP, CH_REF=BR-PS{PS:BD2}I-SP_Ref, CH_TOL=BR-PS{PS:BD2}I_SP_Tol-SP, CH_ARCH=BR-PS{PS:BD2}I_SP_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}I_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}I_SP_DiffArch-I, CH_FLG=BR-PS{PS:BD2}I_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}I_SP_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}I_SP_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I-SP, CH_REF=BR-PS{PS:BD2}I-SP_Ref, CH_DIFFREF=BR-PS{PS:BD2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I-SP, CH_REF=BR-PS{PS:BD2}I-SP_Ref, CH_DIFFREF=BR-PS{PS:BD2}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}I-I, CH_REF=BR-PS{PS:BD2}I-I_Ref, CH_TOL=BR-PS{PS:BD2}I_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}I_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}I_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}I_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}I_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}I_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}I_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I-I, CH_REF=BR-PS{PS:BD2}I-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I-I, CH_REF=BR-PS{PS:BD2}I-SP-1k, CH_DIFFREF=BR-PS{PS:BD2}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}I:DCCT2-I, CH_REF=BR-PS{PS:BD2}I:DCCT2-I_Ref, CH_TOL=BR-PS{PS:BD2}I:DCCT2_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}I:DCCT2_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}I:DCCT2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}I:DCCT2_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}I:DCCT2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}I:DCCT2_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}I:DCCT2_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:DCCT2-I, CH_REF=BR-PS{PS:BD2}I:DCCT2-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:DCCT2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:DCCT2-I, CH_REF=BR-PS{PS:BD2}I-SP-1k, CH_DIFFREF=BR-PS{PS:BD2}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:DCCT2_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}I:Err-I, CH_REF=BR-PS{PS:BD2}I:Err-I_Ref, CH_TOL=BR-PS{PS:BD2}I:Err_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}I:Err_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}I:Err_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}I:Err_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}I:Err_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}I:Err_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}I:Err_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:Err-I, CH_REF=BR-PS{PS:BD2}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:Err_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:Err-I, CH_REF=BR-PS{PS:BD2}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:Err_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}E:PSout-I, CH_REF=BR-PS{PS:BD2}E:PSout-I_Ref, CH_TOL=BR-PS{PS:BD2}E:PSout_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}E:PSout_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}E:PSout_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}E:PSout_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}E:PSout_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}E:PSout_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}E:PSout_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}E:PSout-I, CH_REF=BR-PS{PS:BD2}E:PSout-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}E:PSout_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}E:PSout_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}E:PSout-I, CH_REF=BR-PS{PS:BD2}E:PSout-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}E:PSout_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}E:PSout_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}I:GND-I, CH_REF=BR-PS{PS:BD2}I:GND-I_Ref, CH_TOL=BR-PS{PS:BD2}I:GND_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}I:GND_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}I:GND_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}I:GND_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}I:GND_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}I:GND_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}I:GND_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:GND-I, CH_REF=BR-PS{PS:BD2}I:GND-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:GND_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:GND_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:GND-I, CH_REF=BR-PS{PS:BD2}I:GND-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:GND_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:GND_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}E:BankH-I, CH_REF=BR-PS{PS:BD2}E:BankH-I_Ref, CH_TOL=BR-PS{PS:BD2}E:BankH_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}E:BankH_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}E:BankH_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}E:BankH_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}E:BankH_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}E:BankH_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}E:BankH_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}E:BankH-I, CH_REF=BR-PS{PS:BD2}E:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}E:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}E:BankH_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}E:BankH-I, CH_REF=BR-PS{PS:BD2}E:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}E:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}E:BankH_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}I:BankH-I, CH_REF=BR-PS{PS:BD2}I:BankH-I_Ref, CH_TOL=BR-PS{PS:BD2}I:BankH_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}I:BankH_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}I:BankH_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}I:BankH_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}I:BankH_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}I:BankH_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}I:BankH_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:BankH-I, CH_REF=BR-PS{PS:BD2}I:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:BankH_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:BankH-I, CH_REF=BR-PS{PS:BD2}I:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:BankH_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}I:DAC-I, CH_REF=BR-PS{PS:BD2}I:DAC-I_Ref, CH_TOL=BR-PS{PS:BD2}I:DAC_I_Tol-SP,  CH_ARCH=BR-PS{PS:BD2}I:DAC_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}I:DAC_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}I:DAC_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}I:DAC_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:DAC-I, CH_REF=BR-PS{PS:BD2}I:DAC-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:DAC-I, CH_REF=BR-PS{PS:BD2}I-SP-1k, CH_DIFFREF=BR-PS{PS:BD2}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}E:BankL-I, CH_REF=BR-PS{PS:BD2}E:BankL-I_Ref, CH_TOL=BR-PS{PS:BD2}E:BankL_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}E:BankL_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}E:BankL_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}E:BankL_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}E:BankL_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}E:BankL_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}E:BankL_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}E:BankL-I, CH_REF=BR-PS{PS:BD2}E:BankL-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}E:BankL_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}E:BankL_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}E:BankL-I, CH_REF=BR-PS{PS:BD2}E:BankL-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}E:BankL_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}E:BankL_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BD2}I:BankL-I, CH_REF=BR-PS{PS:BD2}I:BankL-I_Ref, CH_TOL=BR-PS{PS:BD2}I:BankL_I_Tol-SP, CH_ARCH=BR-PS{PS:BD2}I:BankL_I_Arch-I, CH_DIFFREF=BR-PS{PS:BD2}I:BankL_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BD2}I:BankL_I_DiffArch-I, CH_FLG=BR-PS{PS:BD2}I:BankL_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}I:BankL_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BD2}I:BankL_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:BankL-I, CH_REF=BR-PS{PS:BD2}I:BankL-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:BankL_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:BankL_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BD2}I:BankL-I, CH_REF=BR-PS{PS:BD2}I:BankL-I_Ref, CH_DIFFREF=BR-PS{PS:BD2}I:BankL_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}I:BankL_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR-PS{PS:BD2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:PwrOff-Cmd_Ref, CH_ARCH=BR-PS{PS:BD2}Cmd:PwrOff_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOff_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Cmd:PwrOff_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:PwrOff-Cmd_Ref, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOff_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOff_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:PwrOff-Cmd_Ref, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOff_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Cmd:PwrOff_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR-PS{PS:BD2}Cmd:RstErr_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:BD2}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BD2}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:BD2}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BD2}Flt:DCCT-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:DCCT_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:DCCT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:DCCT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BD2}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:DCCT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BD2}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:DCCT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BD2}Flt:IGBT-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:IGBT_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:IGBT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:IGBT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BD2}Flt:IGBT-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:IGBT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:IGBT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BD2}Flt:IGBT-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:IGBT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:IGBT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BD2}Flt:AcPhase-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:AcPhase_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:AcPhase_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:AcPhase_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BD2}Flt:AcPhase-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:AcPhase_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:AcPhase_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BD2}Flt:AcPhase-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:AcPhase_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:AcPhase_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSwater-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:PSwater_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:PSwater_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:PSwater_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:PSwater_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:PSwater_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BD2}Flt:Regulator-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:Regulator_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:Regulator_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:Regulator_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BD2}Flt:Regulator-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:Regulator_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:Regulator_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BD2}Flt:Regulator-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:Regulator_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:Regulator_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BD2}Sts:CircBreaker-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Sts:CircBreaker_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Sts:CircBreaker_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Sts:CircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BD2}Sts:CircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:CircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:CircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BD2}Sts:CircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:CircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:CircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:PSovrheat_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BD2}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BD2}Flt:Loadovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:Loadovrheat_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:Loadovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:Loadovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BD2}Flt:Loadovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:Loadovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:Loadovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BD2}Flt:Loadovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:Loadovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:Loadovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BD2}Flt:BankFuse-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:BankFuse_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:BankFuse_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:BankFuse_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BD2}Flt:BankFuse-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:BankFuse_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:BankFuse_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BD2}Flt:BankFuse-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:BankFuse_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:BankFuse_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BD2}Sts:RmtCtrl-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Sts:RmtCtrl_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Sts:RmtCtrl_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Sts:RmtCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BD2}Sts:RmtCtrl-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:RmtCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:RmtCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BD2}Sts:RmtCtrl-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:RmtCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:RmtCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BD2}Sts:Rdy-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Sts:Rdy_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BD2}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BD2}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BD2}Flt:GNDleak-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:GNDleak_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:GNDleak_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:GNDleak_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BD2}Flt:GNDleak-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:GNDleak_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:GNDleak_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BD2}Flt:GNDleak-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:GNDleak_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:GNDleak_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BD2}Flt:DoorEmergButt-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Flt:DoorEmergButt_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Flt:DoorEmergButt_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Flt:DoorEmergButt_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BD2}Flt:DoorEmergButt-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:DoorEmergButt_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:DoorEmergButt_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BD2}Flt:DoorEmergButt-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Flt:DoorEmergButt_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Flt:DoorEmergButt_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BD2}Sts:SumInterlock-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Sts:SumInterlock_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Sts:SumInterlock_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Sts:SumInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BD2}Sts:SumInterlock-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:SumInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:SumInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BD2}Sts:SumInterlock-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:SumInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:SumInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BD2}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BD2}Sts:PwrOn-Sts_Ref, CH_ARCH=BR-PS{PS:BD2}Sts:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:BD2}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BD2}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BD2}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BD2}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BD2}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:BD2}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BD2}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR-PS{PS:BF} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR-PS{PS:BF}I-SP,              OUTPUT=BR{PSC03}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:01-I,          OUTPUT=BR-PS{PS:BF}I_Raw-I,         WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:16-I,          OUTPUT=BR-PS{PS:BF}I:DCCT2_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:02-I,          OUTPUT=BR-PS{PS:BF}I:Err_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:03-I,          OUTPUT=BR-PS{PS:BF}E:PSout_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:04-I,          OUTPUT=BR-PS{PS:BF}I:GND_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:05-I,          OUTPUT=BR-PS{PS:BF}E:BankH_Raw-I,   WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:06-I,          OUTPUT=BR-PS{PS:BF}I:BankH_Raw-I,   WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC03}ADC:09-I,          OUTPUT=BR-PS{PS:BF}I:DAC_Raw-I,     WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BF}Cmd:PwrOn-Cmd,     OUTPUT=BR{PSC03}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BF}Cmd:PwrOff-Cmd,    OUTPUT=BR{PSC03}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR-PS{PS:BF}Cmd:RstErr-Cmd,    OUTPUT=BR{PSC03}DO:3-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:00-Sts,         OUTPUT=BR-PS{PS:BF}Flt:DCCT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:01-Sts,         OUTPUT=BR-PS{PS:BF}Flt:IGBT-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:02-Sts,         OUTPUT=BR-PS{PS:BF}Flt:AcPhase-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:03-Sts,         OUTPUT=BR-PS{PS:BF}Flt:PSwater-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:04-Sts,         OUTPUT=BR-PS{PS:BF}Flt:PSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:05-Sts,         OUTPUT=BR-PS{PS:BF}Flt:Regulator-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:06-Sts,         OUTPUT=BR-PS{PS:BF}Sts:CircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:07-Sts,         OUTPUT=BR-PS{PS:BF}Flt:PSovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:08-Sts,         OUTPUT=BR-PS{PS:BF}Flt:Loadovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:09-Sts,         OUTPUT=BR-PS{PS:BF}Flt:BankFuse-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:10-Sts,         OUTPUT=BR-PS{PS:BF}Sts:RmtCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:11-Sts,         OUTPUT=BR-PS{PS:BF}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:12-Sts,         OUTPUT=BR-PS{PS:BF}Flt:GNDleak-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:13-Sts,         OUTPUT=BR-PS{PS:BF}Flt:DoorEmergButt-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:14-Sts,         OUTPUT=BR-PS{PS:BF}Sts:SumInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC03}DI:15-Sts,         OUTPUT=BR-PS{PS:BF}Sts:PwrOn-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR-PS{PS:BF}I-SP,      OUTPUT=BR-PS{PS:BF}I_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}I_Raw-SP-1k,   OUTPUT=BR-PS{PS:BF}I-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I-SP-1k,       INDEX=BR-PS{PS:BF}I-SP-1k-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}I-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I-SP-1k,       INDEX=BR-PS{PS:BF}I-SP-1k-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}I-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I-SP-1k,       INDEX=BR-PS{PS:BF}I-SP-1k-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}I-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}I_Raw-I,   OUTPUT=BR-PS{PS:BF}I-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I-I,       INDEX=BR-PS{PS:BF}I-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}I-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I-I,       INDEX=BR-PS{PS:BF}I-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}I-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I-I,       INDEX=BR-PS{PS:BF}I-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}I-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}I:DCCT2_Raw-I, OUTPUT=BR-PS{PS:BF}I:DCCT2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:DCCT2-I,     INDEX=BR-PS{PS:BF}I:DCCT2-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}I:DCCT2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:DCCT2-I,     INDEX=BR-PS{PS:BF}I:DCCT2-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}I:DCCT2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:DCCT2-I,     INDEX=BR-PS{PS:BF}I:DCCT2-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}I:DCCT2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}I:Err_Raw-I,   OUTPUT=BR-PS{PS:BF}I:Err-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:Err-I,       INDEX=BR-PS{PS:BF}I:Err-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}I:Err-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:Err-I,       INDEX=BR-PS{PS:BF}I:Err-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}I:Err-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:Err-I,       INDEX=BR-PS{PS:BF}I:Err-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}I:Err-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}E:PSout_Raw-I,   OUTPUT=BR-PS{PS:BF}E:PSout-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}E:PSout-I,       INDEX=BR-PS{PS:BF}E:PSout-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}E:PSout-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}E:PSout-I,       INDEX=BR-PS{PS:BF}E:PSout-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}E:PSout-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}E:PSout-I,       INDEX=BR-PS{PS:BF}E:PSout-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}E:PSout-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}I:GND_Raw-I,   OUTPUT=BR-PS{PS:BF}I:GND-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:GND-I,       INDEX=BR-PS{PS:BF}I:GND-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}I:GND-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:GND-I,       INDEX=BR-PS{PS:BF}I:GND-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}I:GND-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:GND-I,       INDEX=BR-PS{PS:BF}I:GND-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}I:GND-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}E:BankH_Raw-I,   OUTPUT=BR-PS{PS:BF}E:BankH-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}E:BankH-I,       INDEX=BR-PS{PS:BF}E:BankH-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}E:BankH-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}E:BankH-I,       INDEX=BR-PS{PS:BF}E:BankH-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}E:BankH-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}E:BankH-I,       INDEX=BR-PS{PS:BF}E:BankH-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}E:BankH-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}I:BankH_Raw-I,   OUTPUT=BR-PS{PS:BF}I:BankH-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:BankH-I,       INDEX=BR-PS{PS:BF}I:BankH-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}I:BankH-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:BankH-I,       INDEX=BR-PS{PS:BF}I:BankH-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}I:BankH-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:BankH-I,       INDEX=BR-PS{PS:BF}I:BankH-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}I:BankH-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR-PS{PS:BF}I:DAC_Raw-I,   OUTPUT=BR-PS{PS:BF}I:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:DAC-I,       INDEX=BR-PS{PS:BF}I:DAC-I-Slicer-Idx1, OUTPUT=BR-PS{PS:BF}I:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:DAC-I,       INDEX=BR-PS{PS:BF}I:DAC-I-Slicer-Idx2, OUTPUT=BR-PS{PS:BF}I:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR-PS{PS:BF}I:DAC-I,       INDEX=BR-PS{PS:BF}I:DAC-I-Slicer-Idx3, OUTPUT=BR-PS{PS:BF}I:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}I-SP, CH_REF=BR-PS{PS:BF}I-SP_Ref, CH_TOL=BR-PS{PS:BF}I_SP_Tol-SP, CH_ARCH=BR-PS{PS:BF}I_SP_Arch-I, CH_DIFFREF=BR-PS{PS:BF}I_SP_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}I_SP_DiffArch-I, CH_FLG=BR-PS{PS:BF}I_SP_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}I_SP_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}I_SP_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I-SP, CH_REF=BR-PS{PS:BF}I-SP_Ref, CH_DIFFREF=BR-PS{PS:BF}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I-SP, CH_REF=BR-PS{PS:BF}I-SP_Ref, CH_DIFFREF=BR-PS{PS:BF}I_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}I-I, CH_REF=BR-PS{PS:BF}I-I_Ref, CH_TOL=BR-PS{PS:BF}I_I_Tol-SP, CH_ARCH=BR-PS{PS:BF}I_I_Arch-I, CH_DIFFREF=BR-PS{PS:BF}I_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}I_I_DiffArch-I, CH_FLG=BR-PS{PS:BF}I_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}I_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}I_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I-I, CH_REF=BR-PS{PS:BF}I-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I-I, CH_REF=BR-PS{PS:BF}I-SP-1k, CH_DIFFREF=BR-PS{PS:BF}I_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}I:DCCT2-I, CH_REF=BR-PS{PS:BF}I:DCCT2-I_Ref, CH_TOL=BR-PS{PS:BF}I:DCCT2_I_Tol-SP, CH_ARCH=BR-PS{PS:BF}I:DCCT2_I_Arch-I, CH_DIFFREF=BR-PS{PS:BF}I:DCCT2_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}I:DCCT2_I_DiffArch-I, CH_FLG=BR-PS{PS:BF}I:DCCT2_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}I:DCCT2_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}I:DCCT2_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:DCCT2-I, CH_REF=BR-PS{PS:BF}I:DCCT2-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:DCCT2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:DCCT2-I, CH_REF=BR-PS{PS:BF}I-SP-1k, CH_DIFFREF=BR-PS{PS:BF}I:DCCT2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:DCCT2_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}I:Err-I, CH_REF=BR-PS{PS:BF}I:Err-I_Ref, CH_TOL=BR-PS{PS:BF}I:Err_I_Tol-SP, CH_ARCH=BR-PS{PS:BF}I:Err_I_Arch-I, CH_DIFFREF=BR-PS{PS:BF}I:Err_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}I:Err_I_DiffArch-I, CH_FLG=BR-PS{PS:BF}I:Err_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}I:Err_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}I:Err_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:Err-I, CH_REF=BR-PS{PS:BF}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:Err_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:Err-I, CH_REF=BR-PS{PS:BF}I:Err-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I:Err_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:Err_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}E:PSout-I, CH_REF=BR-PS{PS:BF}E:PSout-I_Ref, CH_TOL=BR-PS{PS:BF}E:PSout_I_Tol-SP, CH_ARCH=BR-PS{PS:BF}E:PSout_I_Arch-I, CH_DIFFREF=BR-PS{PS:BF}E:PSout_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}E:PSout_I_DiffArch-I, CH_FLG=BR-PS{PS:BF}E:PSout_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}E:PSout_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}E:PSout_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}E:PSout-I, CH_REF=BR-PS{PS:BF}E:PSout-I_Ref, CH_DIFFREF=BR-PS{PS:BF}E:PSout_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}E:PSout_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}E:PSout-I, CH_REF=BR-PS{PS:BF}E:PSout-I_Ref, CH_DIFFREF=BR-PS{PS:BF}E:PSout_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}E:PSout_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}I:GND-I, CH_REF=BR-PS{PS:BF}I:GND-I_Ref, CH_TOL=BR-PS{PS:BF}I:GND_I_Tol-SP, CH_ARCH=BR-PS{PS:BF}I:GND_I_Arch-I, CH_DIFFREF=BR-PS{PS:BF}I:GND_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}I:GND_I_DiffArch-I, CH_FLG=BR-PS{PS:BF}I:GND_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}I:GND_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}I:GND_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:GND-I, CH_REF=BR-PS{PS:BF}I:GND-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I:GND_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:GND_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:GND-I, CH_REF=BR-PS{PS:BF}I:GND-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I:GND_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:GND_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}E:BankH-I, CH_REF=BR-PS{PS:BF}E:BankH-I_Ref, CH_TOL=BR-PS{PS:BF}E:BankH_I_Tol-SP, CH_ARCH=BR-PS{PS:BF}E:BankH_I_Arch-I, CH_DIFFREF=BR-PS{PS:BF}E:BankH_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}E:BankH_I_DiffArch-I, CH_FLG=BR-PS{PS:BF}E:BankH_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}E:BankH_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}E:BankH_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}E:BankH-I, CH_REF=BR-PS{PS:BF}E:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BF}E:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}E:BankH_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}E:BankH-I, CH_REF=BR-PS{PS:BF}E:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BF}E:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}E:BankH_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}I:BankH-I, CH_REF=BR-PS{PS:BF}I:BankH-I_Ref, CH_TOL=BR-PS{PS:BF}I:BankH_I_Tol-SP, CH_ARCH=BR-PS{PS:BF}I:BankH_I_Arch-I, CH_DIFFREF=BR-PS{PS:BF}I:BankH_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}I:BankH_I_DiffArch-I, CH_FLG=BR-PS{PS:BF}I:BankH_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}I:BankH_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}I:BankH_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:BankH-I, CH_REF=BR-PS{PS:BF}I:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:BankH_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:BankH-I, CH_REF=BR-PS{PS:BF}I:BankH-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I:BankH_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:BankH_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR-PS{PS:BF}I:DAC-I, CH_REF=BR-PS{PS:BF}I:DAC-I_Ref, CH_TOL=BR-PS{PS:BF}I:DAC_I_Tol-SP,  CH_ARCH=BR-PS{PS:BF}I:DAC_I_Arch-I, CH_DIFFREF=BR-PS{PS:BF}I:DAC_I_DiffRef-I, CH_DIFFARCH=BR-PS{PS:BF}I:DAC_I_DiffArch-I, CH_FLG=BR-PS{PS:BF}I:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}I:DAC_I_ArchFlg-Sts, CH_COEFF=BR-PS{PS:BF}I:DAC_I_MonitCoeff-SP, MODE_PV=BR{}MonitMode-Sel, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:DAC-I, CH_REF=BR-PS{PS:BF}I:DAC-I_Ref, CH_DIFFREF=BR-PS{PS:BF}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR-PS{PS:BF}I:DAC-I, CH_REF=BR-PS{PS:BF}I-SP-1k, CH_DIFFREF=BR-PS{PS:BF}I:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}I:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BF}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR-PS{PS:BF}Cmd:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:BF}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BF}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:BF}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Cmd:PwrOn-Cmd, CH_REF=BR-PS{PS:BF}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR-PS{PS:BF}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BF}Cmd:PwrOff-Cmd_Ref, CH_ARCH=BR-PS{PS:BF}Cmd:PwrOff_Arch-Sts, CH_FLG=BR-PS{PS:BF}Cmd:PwrOff_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Cmd:PwrOff_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BF}Cmd:PwrOff-Cmd_Ref, CH_FLG=BR-PS{PS:BF}Cmd:PwrOff_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Cmd:PwrOff_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Cmd:PwrOff-Cmd, CH_REF=BR-PS{PS:BF}Cmd:PwrOff-Cmd_Ref, CH_FLG=BR-PS{PS:BF}Cmd:PwrOff_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Cmd:PwrOff_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BF}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR-PS{PS:BF}Cmd:RstErr_Arch-Sts, CH_FLG=BR-PS{PS:BF}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BF}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:BF}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Cmd:RstErr-Cmd, CH_REF=BR-PS{PS:BF}Cmd:RstErr-Cmd_Ref, CH_FLG=BR-PS{PS:BF}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BF}Flt:DCCT-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:DCCT_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:DCCT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:DCCT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BF}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:DCCT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:DCCT-Sts, CH_REF=BR-PS{PS:BF}Flt:DCCT-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:DCCT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:DCCT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BF}Flt:IGBT-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:IGBT_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:IGBT_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:IGBT_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BF}Flt:IGBT-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:IGBT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:IGBT_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:IGBT-Sts, CH_REF=BR-PS{PS:BF}Flt:IGBT-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:IGBT_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:IGBT_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BF}Flt:AcPhase-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:AcPhase_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:AcPhase_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:AcPhase_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BF}Flt:AcPhase-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:AcPhase_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:AcPhase_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:AcPhase-Sts, CH_REF=BR-PS{PS:BF}Flt:AcPhase-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:AcPhase_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:AcPhase_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BF}Flt:PSwater-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:PSwater_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:PSwater_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:PSwater_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BF}Flt:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:PSwater_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:PSwater-Sts, CH_REF=BR-PS{PS:BF}Flt:PSwater-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:PSwater_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:PSwater_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BF}Flt:PSovrcurr-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:PSovrcurr_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:PSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:PSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BF}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:PSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:PSovrcurr-Sts, CH_REF=BR-PS{PS:BF}Flt:PSovrcurr-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:PSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:PSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BF}Flt:Regulator-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:Regulator_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:Regulator_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:Regulator_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BF}Flt:Regulator-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:Regulator_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:Regulator_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:Regulator-Sts, CH_REF=BR-PS{PS:BF}Flt:Regulator-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:Regulator_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:Regulator_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BF}Sts:CircBreaker-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Sts:CircBreaker_Arch-Sts, CH_FLG=BR-PS{PS:BF}Sts:CircBreaker_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Sts:CircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BF}Sts:CircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:CircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:CircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:CircBreaker-Sts, CH_REF=BR-PS{PS:BF}Sts:CircBreaker-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:CircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:CircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BF}Flt:PSovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:PSovrheat_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:PSovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:PSovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BF}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:PSovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:PSovrheat-Sts, CH_REF=BR-PS{PS:BF}Flt:PSovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:PSovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:PSovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BF}Flt:Loadovrheat-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:Loadovrheat_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:Loadovrheat_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:Loadovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BF}Flt:Loadovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:Loadovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:Loadovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:Loadovrheat-Sts, CH_REF=BR-PS{PS:BF}Flt:Loadovrheat-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:Loadovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:Loadovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BF}Flt:BankFuse-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:BankFuse_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:BankFuse_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:BankFuse_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BF}Flt:BankFuse-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:BankFuse_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:BankFuse_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:BankFuse-Sts, CH_REF=BR-PS{PS:BF}Flt:BankFuse-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:BankFuse_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:BankFuse_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BF}Sts:RmtCtrl-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Sts:RmtCtrl_Arch-Sts, CH_FLG=BR-PS{PS:BF}Sts:RmtCtrl_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Sts:RmtCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BF}Sts:RmtCtrl-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:RmtCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:RmtCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:RmtCtrl-Sts, CH_REF=BR-PS{PS:BF}Sts:RmtCtrl-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:RmtCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:RmtCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BF}Sts:Rdy-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Sts:Rdy_Arch-Sts, CH_FLG=BR-PS{PS:BF}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BF}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:Rdy-Sts, CH_REF=BR-PS{PS:BF}Sts:Rdy-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BF}Flt:GNDleak-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:GNDleak_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:GNDleak_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:GNDleak_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BF}Flt:GNDleak-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:GNDleak_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:GNDleak_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:GNDleak-Sts, CH_REF=BR-PS{PS:BF}Flt:GNDleak-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:GNDleak_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:GNDleak_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BF}Flt:DoorEmergButt-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Flt:DoorEmergButt_Arch-Sts, CH_FLG=BR-PS{PS:BF}Flt:DoorEmergButt_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Flt:DoorEmergButt_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BF}Flt:DoorEmergButt-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:DoorEmergButt_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:DoorEmergButt_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Flt:DoorEmergButt-Sts, CH_REF=BR-PS{PS:BF}Flt:DoorEmergButt-Sts_Ref, CH_FLG=BR-PS{PS:BF}Flt:DoorEmergButt_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Flt:DoorEmergButt_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BF}Sts:SumInterlock-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Sts:SumInterlock_Arch-Sts, CH_FLG=BR-PS{PS:BF}Sts:SumInterlock_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Sts:SumInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BF}Sts:SumInterlock-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:SumInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:SumInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:SumInterlock-Sts, CH_REF=BR-PS{PS:BF}Sts:SumInterlock-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:SumInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:SumInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR-PS{PS:BF}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BF}Sts:PwrOn-Sts_Ref, CH_ARCH=BR-PS{PS:BF}Sts:PwrOn_Arch-Sts, CH_FLG=BR-PS{PS:BF}Sts:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR-PS{PS:BF}Sts:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BF}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR-PS{PS:BF}Sts:PwrOn-Sts, CH_REF=BR-PS{PS:BF}Sts:PwrOn-Sts_Ref, CH_FLG=BR-PS{PS:BF}Sts:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR-PS{PS:BF}Sts:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")


var(PSCDebug, 1)
#with debug message: var(PSCDebug, 2)

#Tx socket
createPSC("TxPSC01", "br-psc01", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC01", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC01", "br-psc01", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC01", 80, 128)

#Tx socket
createPSC("TxPSC02", "br-psc02", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC02", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC02", "br-psc02", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC02", 80, 128)

#Tx socket
createPSC("TxPSC03", "br-psc03", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC03", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC03", "br-psc03", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC03", 80, 128)

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

