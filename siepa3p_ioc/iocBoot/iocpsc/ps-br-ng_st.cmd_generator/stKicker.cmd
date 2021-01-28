#!../../bin/linux-x86/psc

< envPaths

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST","NO")
epicsEnvSet("EPICS_CA_ADDR_LIST","10.0.153.255")
epicsEnvSet("IOCNAME", "ps-br-kicker-ng")

# to avoid a lot of "scanOnce: Ring buffer overflow" during save/restore initialization
scanOnceSetQueueSize(2000)

#epicsThreadSleep 5

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/psc.dbd",0,0)
psc_registerRecordDeviceDriver(pdbbase)

## Load record instances


dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC07")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC07")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC07, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:00_Raw-I,  OUTPUT=BR{PSC07}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:01_Raw-I,  OUTPUT=BR{PSC07}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:02_Raw-I,  OUTPUT=BR{PSC07}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:03_Raw-I,  OUTPUT=BR{PSC07}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:04_Raw-I,  OUTPUT=BR{PSC07}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:05_Raw-I,  OUTPUT=BR{PSC07}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:06_Raw-I,  OUTPUT=BR{PSC07}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:07_Raw-I,  OUTPUT=BR{PSC07}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:08_Raw-I,  OUTPUT=BR{PSC07}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:09_Raw-I,  OUTPUT=BR{PSC07}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:10_Raw-I,  OUTPUT=BR{PSC07}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:11_Raw-I,  OUTPUT=BR{PSC07}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:12_Raw-I,  OUTPUT=BR{PSC07}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:13_Raw-I,  OUTPUT=BR{PSC07}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:14_Raw-I,  OUTPUT=BR{PSC07}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:15_Raw-I,  OUTPUT=BR{PSC07}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:16_Raw-I,  OUTPUT=BR{PSC07}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:17_Raw-I,  OUTPUT=BR{PSC07}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC07}ADC10k:0_Raw-I,  OUTPUT=BR{PSC07}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC07}ADC10k:1_Raw-I,  OUTPUT=BR{PSC07}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC07}ADC10k:0-I, INPUT2=BR{PSC07}ADC10k:1-I, OUTPUT=BR{PSC07}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC07}ADC10k:0_Raw-I,  OUTPUT=BR{PSC07}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC07}ADC10k:1_Raw-I,  OUTPUT=BR{PSC07}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC07, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC07}DAC:0-SP,         OUTPUT=BR{PSC07}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC07}DAC:0_Raw-SP,     OUTPUT=BR{PSC07}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC07}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC07}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC07, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC07}DAC:1-SP,         OUTPUT=BR{PSC07}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC07}DAC:1_Raw-SP,     OUTPUT=BR{PSC07}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC07}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC07}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC08")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC08")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC08, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:00_Raw-I,  OUTPUT=BR{PSC08}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:01_Raw-I,  OUTPUT=BR{PSC08}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:02_Raw-I,  OUTPUT=BR{PSC08}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:03_Raw-I,  OUTPUT=BR{PSC08}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:04_Raw-I,  OUTPUT=BR{PSC08}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:05_Raw-I,  OUTPUT=BR{PSC08}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:06_Raw-I,  OUTPUT=BR{PSC08}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:07_Raw-I,  OUTPUT=BR{PSC08}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:08_Raw-I,  OUTPUT=BR{PSC08}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:09_Raw-I,  OUTPUT=BR{PSC08}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:10_Raw-I,  OUTPUT=BR{PSC08}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:11_Raw-I,  OUTPUT=BR{PSC08}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:12_Raw-I,  OUTPUT=BR{PSC08}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:13_Raw-I,  OUTPUT=BR{PSC08}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:14_Raw-I,  OUTPUT=BR{PSC08}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:15_Raw-I,  OUTPUT=BR{PSC08}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:16_Raw-I,  OUTPUT=BR{PSC08}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:17_Raw-I,  OUTPUT=BR{PSC08}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC08}ADC10k:0_Raw-I,  OUTPUT=BR{PSC08}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC08}ADC10k:1_Raw-I,  OUTPUT=BR{PSC08}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC08}ADC10k:0-I, INPUT2=BR{PSC08}ADC10k:1-I, OUTPUT=BR{PSC08}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC08}ADC10k:0_Raw-I,  OUTPUT=BR{PSC08}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC08}ADC10k:1_Raw-I,  OUTPUT=BR{PSC08}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC08, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC08}DAC:0-SP,         OUTPUT=BR{PSC08}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC08}DAC:0_Raw-SP,     OUTPUT=BR{PSC08}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC08}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC08}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC08, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC08}DAC:1-SP,         OUTPUT=BR{PSC08}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC08}DAC:1_Raw-SP,     OUTPUT=BR{PSC08}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC08}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC08}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC09")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC09")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC09, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:00_Raw-I,  OUTPUT=BR{PSC09}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:01_Raw-I,  OUTPUT=BR{PSC09}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:02_Raw-I,  OUTPUT=BR{PSC09}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:03_Raw-I,  OUTPUT=BR{PSC09}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:04_Raw-I,  OUTPUT=BR{PSC09}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:05_Raw-I,  OUTPUT=BR{PSC09}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:06_Raw-I,  OUTPUT=BR{PSC09}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:07_Raw-I,  OUTPUT=BR{PSC09}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:08_Raw-I,  OUTPUT=BR{PSC09}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:09_Raw-I,  OUTPUT=BR{PSC09}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:10_Raw-I,  OUTPUT=BR{PSC09}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:11_Raw-I,  OUTPUT=BR{PSC09}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:12_Raw-I,  OUTPUT=BR{PSC09}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:13_Raw-I,  OUTPUT=BR{PSC09}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:14_Raw-I,  OUTPUT=BR{PSC09}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:15_Raw-I,  OUTPUT=BR{PSC09}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:16_Raw-I,  OUTPUT=BR{PSC09}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:17_Raw-I,  OUTPUT=BR{PSC09}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC09}ADC10k:0_Raw-I,  OUTPUT=BR{PSC09}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC09}ADC10k:1_Raw-I,  OUTPUT=BR{PSC09}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC09}ADC10k:0-I, INPUT2=BR{PSC09}ADC10k:1-I, OUTPUT=BR{PSC09}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC09}ADC10k:0_Raw-I,  OUTPUT=BR{PSC09}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC09}ADC10k:1_Raw-I,  OUTPUT=BR{PSC09}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC09, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC09}DAC:0-SP,         OUTPUT=BR{PSC09}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC09}DAC:0_Raw-SP,     OUTPUT=BR{PSC09}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC09}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC09}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC09, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC09}DAC:1-SP,         OUTPUT=BR{PSC09}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC09}DAC:1_Raw-SP,     OUTPUT=BR{PSC09}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC09}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC09}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC10")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC10")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC10, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:00_Raw-I,  OUTPUT=BR{PSC10}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:01_Raw-I,  OUTPUT=BR{PSC10}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:02_Raw-I,  OUTPUT=BR{PSC10}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:03_Raw-I,  OUTPUT=BR{PSC10}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:04_Raw-I,  OUTPUT=BR{PSC10}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:05_Raw-I,  OUTPUT=BR{PSC10}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:06_Raw-I,  OUTPUT=BR{PSC10}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:07_Raw-I,  OUTPUT=BR{PSC10}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:08_Raw-I,  OUTPUT=BR{PSC10}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:09_Raw-I,  OUTPUT=BR{PSC10}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:10_Raw-I,  OUTPUT=BR{PSC10}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:11_Raw-I,  OUTPUT=BR{PSC10}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:12_Raw-I,  OUTPUT=BR{PSC10}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:13_Raw-I,  OUTPUT=BR{PSC10}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:14_Raw-I,  OUTPUT=BR{PSC10}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:15_Raw-I,  OUTPUT=BR{PSC10}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:16_Raw-I,  OUTPUT=BR{PSC10}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:17_Raw-I,  OUTPUT=BR{PSC10}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC10}ADC10k:0_Raw-I,  OUTPUT=BR{PSC10}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC10}ADC10k:1_Raw-I,  OUTPUT=BR{PSC10}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC10}ADC10k:0-I, INPUT2=BR{PSC10}ADC10k:1-I, OUTPUT=BR{PSC10}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC10}ADC10k:0_Raw-I,  OUTPUT=BR{PSC10}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC10}ADC10k:1_Raw-I,  OUTPUT=BR{PSC10}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC10, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC10}DAC:0-SP,         OUTPUT=BR{PSC10}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC10}DAC:0_Raw-SP,     OUTPUT=BR{PSC10}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC10}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC10}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC10, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC10}DAC:1-SP,         OUTPUT=BR{PSC10}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC10}DAC:1_Raw-SP,     OUTPUT=BR{PSC10}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC10}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC10}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC11")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC11")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC11, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:00_Raw-I,  OUTPUT=BR{PSC11}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:01_Raw-I,  OUTPUT=BR{PSC11}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:02_Raw-I,  OUTPUT=BR{PSC11}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:03_Raw-I,  OUTPUT=BR{PSC11}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:04_Raw-I,  OUTPUT=BR{PSC11}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:05_Raw-I,  OUTPUT=BR{PSC11}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:06_Raw-I,  OUTPUT=BR{PSC11}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:07_Raw-I,  OUTPUT=BR{PSC11}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:08_Raw-I,  OUTPUT=BR{PSC11}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:09_Raw-I,  OUTPUT=BR{PSC11}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:10_Raw-I,  OUTPUT=BR{PSC11}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:11_Raw-I,  OUTPUT=BR{PSC11}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:12_Raw-I,  OUTPUT=BR{PSC11}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:13_Raw-I,  OUTPUT=BR{PSC11}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:14_Raw-I,  OUTPUT=BR{PSC11}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:15_Raw-I,  OUTPUT=BR{PSC11}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:16_Raw-I,  OUTPUT=BR{PSC11}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:17_Raw-I,  OUTPUT=BR{PSC11}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC11}ADC10k:0_Raw-I,  OUTPUT=BR{PSC11}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC11}ADC10k:1_Raw-I,  OUTPUT=BR{PSC11}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC11}ADC10k:0-I, INPUT2=BR{PSC11}ADC10k:1-I, OUTPUT=BR{PSC11}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC11}ADC10k:0_Raw-I,  OUTPUT=BR{PSC11}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC11}ADC10k:1_Raw-I,  OUTPUT=BR{PSC11}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC11, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC11}DAC:0-SP,         OUTPUT=BR{PSC11}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC11}DAC:0_Raw-SP,     OUTPUT=BR{PSC11}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC11}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC11}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC11, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC11}DAC:1-SP,         OUTPUT=BR{PSC11}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC11}DAC:1_Raw-SP,     OUTPUT=BR{PSC11}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC11}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC11}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Commands.db",       "PriSys=BR, PS=PSC12")
dbLoadRecords("db/Status.db",         "PriSys=BR, PS=PSC12")
# ADC waveforms (both 10k and 1k)
dbLoadRecords("db/ADCWaveform.db",    "PSy=BR, PS=PSC12, TIMESTAMP=BST-TS{EVR:B1A}Cnt:BRPrev-I, ADC1K_POINTS=1014, ADC10K_POINTS=10150")
# adjusted ADC waveforms are below
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:00_Raw-I,  OUTPUT=BR{PSC12}ADC:00-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:01_Raw-I,  OUTPUT=BR{PSC12}ADC:01-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:02_Raw-I,  OUTPUT=BR{PSC12}ADC:02-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:03_Raw-I,  OUTPUT=BR{PSC12}ADC:03-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:04_Raw-I,  OUTPUT=BR{PSC12}ADC:04-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:05_Raw-I,  OUTPUT=BR{PSC12}ADC:05-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:06_Raw-I,  OUTPUT=BR{PSC12}ADC:06-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:07_Raw-I,  OUTPUT=BR{PSC12}ADC:07-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:08_Raw-I,  OUTPUT=BR{PSC12}ADC:08-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:09_Raw-I,  OUTPUT=BR{PSC12}ADC:09-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:10_Raw-I,  OUTPUT=BR{PSC12}ADC:10-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:11_Raw-I,  OUTPUT=BR{PSC12}ADC:11-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:12_Raw-I,  OUTPUT=BR{PSC12}ADC:12-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:13_Raw-I,  OUTPUT=BR{PSC12}ADC:13-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:14_Raw-I,  OUTPUT=BR{PSC12}ADC:14-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:15_Raw-I,  OUTPUT=BR{PSC12}ADC:15-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:16_Raw-I,  OUTPUT=BR{PSC12}ADC:16-I, WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:17_Raw-I,  OUTPUT=BR{PSC12}ADC:17-I, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR{PSC12}ADC10k:0_Raw-I,  OUTPUT=BR{PSC12}ADC10k:0-I, WF_LENGTH=10150")
dbLoadRecords("db/Average.db",        "INPUT=BR{PSC12}ADC10k:1_Raw-I,  OUTPUT=BR{PSC12}ADC10k:1-I, WF_LENGTH=10150")
dbLoadRecords("db/Subtract.db",       "INPUT1=BR{PSC12}ADC10k:0-I, INPUT2=BR{PSC12}ADC10k:1-I, OUTPUT=BR{PSC12}ADC10k_Sub-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC12}ADC10k:0_Raw-I,  OUTPUT=BR{PSC12}ADC10k:0_Raw_I_FFT-I, WF_LENGTH=10150")
dbLoadRecords("db/FFT.db",            "INPUT=BR{PSC12}ADC10k:1_Raw-I,  OUTPUT=BR{PSC12}ADC10k:1_Raw_I_FFT-I, WF_LENGTH=10150")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC12, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=0, MSGID=81, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC12}DAC:0-SP,         OUTPUT=BR{PSC12}DAC:0_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC12}DAC:0_Raw-SP,     OUTPUT=BR{PSC12}DAC:0_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC12}DAC:0_Raw_tr-SP,  OUTPUT=BR{PSC12}DAC:0_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/RampingTable.db",   "PriSys=BR, PSC=PSC12, RAWDATA_LENGTH=43440, WF10K_LENGTH=10150, CHANNEL=1, MSGID=82, DELTA=BR-PS{}KIC_Delta-SP, DELTA_STEPS=BR-PS{}KIC_DeltaSteps-SP")
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR{PSC12}DAC:1-SP,         OUTPUT=BR{PSC12}DAC:1_Raw-SP,       WF_LENGTH=10150")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC12}DAC:1_Raw-SP,     OUTPUT=BR{PSC12}DAC:1_Raw-SP-1k,    WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")
dbLoadRecords("db/Subsampling.db",    "INPUT=BR{PSC12}DAC:1_Raw_tr-SP,  OUTPUT=BR{PSC12}DAC:1_Raw_tr-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

# BR:IS-PS{PS:KIC1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:IS-PS{PS:KIC1}E:PFN-SP,                              OUTPUT=BR{PSC07}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:00-I,          OUTPUT=BR:IS-PS{PS:KIC1}E:DAC_Raw-I,             WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:01-I,          OUTPUT=BR:IS-PS{PS:KIC1}E:PFN_Raw-I,             WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:02-I,          OUTPUT=BR:IS-PS{PS:KIC1}I:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:03-I,          OUTPUT=BR:IS-PS{PS:KIC1}E:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:04-I,          OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:05-I,          OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC07}ADC:06-I,          OUTPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_Raw-I,  WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC1}Cmd:RstErr-Cmd,                        OUTPUT=BR{PSC07}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC1}Cmd:PwrOn-Cmd,                         OUTPUT=BR{PSC07}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC1}Cmd:Stdby-Cmd,                         OUTPUT=BR{PSC07}DO:2-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:00-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:01-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Flt:PFNvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:02-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Flt:PSUovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:03-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:04-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:05-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:06-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Flt:BiasPS-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:07-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:PSUcontactor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:09-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:PulserDoors-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:10-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:11-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:LocalCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:12-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:13-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:14-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Sts:PulserHVrly-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC07}DI:15-Sts,         OUTPUT=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:IS-PS{PS:KIC1}E:PFN-SP,              OUTPUT=BR:IS-PS{PS:KIC1}E:PFN_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC1}E:PFN_Raw-SP-1k,       OUTPUT=BR:IS-PS{PS:KIC1}E:PFN-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC1}E:DAC_Raw-I,           OUTPUT=BR:IS-PS{PS:KIC1}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC1}E:DAC-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC1}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC1}E:DAC-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC1}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC1}E:DAC-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC1}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC1}E:PFN_Raw-I,           OUTPUT=BR:IS-PS{PS:KIC1}E:PFN-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC1}E:PFN-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC1}E:PFN-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC1}E:PFN-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC1}E:PFN-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC1}E:PFN-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC1}E:PFN-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC1}I:HVPS_Raw-I,          OUTPUT=BR:IS-PS{PS:KIC1}I:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC1}I:HVPS-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC1}I:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC1}I:HVPS-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC1}I:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC1}I:HVPS-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC1}I:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC1}E:HVPS_Raw-I,          OUTPUT=BR:IS-PS{PS:KIC1}E:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC1}E:HVPS-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC1}E:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC1}E:HVPS-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC1}E:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC1}E:HVPS-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC1}E:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1_Raw-I,   OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2_Raw-I,   OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_Raw-I,OUTPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC1}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC1}E:PFN-SP_Ref, CH_TOL=BR:IS-PS{PS:KIC1}E:PFN_SP_Tol-SP, CH_ARCH=BR:IS-PS{PS:KIC1}E:PFN_SP_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:PFN_SP_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC1}E:PFN_SP_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC1}E:PFN_SP_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}E:PFN_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC1}E:PFN_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC1}E:PFN-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:PFN_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC1}E:PFN-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:PFN_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC1}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC1}E:DAC-I_Ref, CH_TOL=BR:IS-PS{PS:KIC1}E:DAC_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC1}E:DAC_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC1}E:DAC_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC1}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC1}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC1}E:DAC-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC1}E:PFN-SP-1k, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC1}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC1}E:PFN-I_Ref, CH_TOL=BR:IS-PS{PS:KIC1}E:PFN_I_Tol-SP, CH_ARCH=BR:IS-PS{PS:KIC1}E:PFN_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:PFN_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC1}E:PFN_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC1}E:PFN_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}E:PFN_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC1}E:PFN_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC1}E:PFN-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:PFN_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC1}E:PFN-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:PFN_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC1}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC1}I:HVPS-I_Ref, CH_TOL=BR:IS-PS{PS:KIC1}I:HVPS_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC1}I:HVPS_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC1}I:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC1}I:HVPS_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC1}I:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}I:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC1}I:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC1}I:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}I:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC1}I:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}I:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC1}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC1}E:HVPS-I_Ref, CH_TOL=BR:IS-PS{PS:KIC1}E:HVPS_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC1}E:HVPS_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC1}E:HVPS_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC1}E:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}E:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC1}E:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC1}E:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC1}E:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I_Ref, CH_TOL=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC1}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:ThyrHeater1_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I_Ref, CH_TOL=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC1}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}E:ThyrHeater2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I_Ref, CH_TOL=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Cmd:RstErr_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:Stdby-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Cmd:Stdby_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Cmd:Stdby_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC1}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:Rdy-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:Rdy_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:Rdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:Rdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:PFNvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Flt:PFNvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Flt:PFNvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:PSUovrheat-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Flt:PSUovrheat_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Flt:PSUovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:BiasPS-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Flt:BiasPS_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Flt:BiasPS_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:BiasPS-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:BiasPS-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PSUcontactor-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:PSUcontactor_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:PSUcontactor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserDoors-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:PulserDoors_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:PulserDoors_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:LocalCtrl-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:LocalCtrl_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:LocalCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:EmergButton_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserHVrly-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Sts:PulserHVrly_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Sts:PulserHVrly_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC1}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR:IS-PS{PS:KIC2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:IS-PS{PS:KIC2}E:PFN-SP,                              OUTPUT=BR{PSC08}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:00-I,          OUTPUT=BR:IS-PS{PS:KIC2}E:DAC_Raw-I,             WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:01-I,          OUTPUT=BR:IS-PS{PS:KIC2}E:PFN_Raw-I,             WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:02-I,          OUTPUT=BR:IS-PS{PS:KIC2}I:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:03-I,          OUTPUT=BR:IS-PS{PS:KIC2}E:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:04-I,          OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:05-I,          OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC08}ADC:06-I,          OUTPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_Raw-I,  WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC2}Cmd:RstErr-Cmd,                        OUTPUT=BR{PSC08}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC2}Cmd:PwrOn-Cmd,                         OUTPUT=BR{PSC08}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC2}Cmd:Stdby-Cmd,                         OUTPUT=BR{PSC08}DO:2-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:00-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:01-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Flt:PFNvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:02-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Flt:PSUovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:03-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:04-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:05-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:06-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Flt:BiasPS-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:07-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:PSUcontactor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:09-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:PulserDoors-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:10-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:11-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:LocalCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:12-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:13-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:14-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Sts:PulserHVrly-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC08}DI:15-Sts,         OUTPUT=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:IS-PS{PS:KIC2}E:PFN-SP,              OUTPUT=BR:IS-PS{PS:KIC2}E:PFN_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC2}E:PFN_Raw-SP-1k,       OUTPUT=BR:IS-PS{PS:KIC2}E:PFN-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC2}E:DAC_Raw-I,           OUTPUT=BR:IS-PS{PS:KIC2}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC2}E:DAC-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC2}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC2}E:DAC-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC2}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC2}E:DAC-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC2}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC2}E:PFN_Raw-I,           OUTPUT=BR:IS-PS{PS:KIC2}E:PFN-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC2}E:PFN-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC2}E:PFN-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC2}E:PFN-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC2}E:PFN-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC2}E:PFN-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC2}E:PFN-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC2}I:HVPS_Raw-I,          OUTPUT=BR:IS-PS{PS:KIC2}I:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC2}I:HVPS-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC2}I:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC2}I:HVPS-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC2}I:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC2}I:HVPS-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC2}I:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC2}E:HVPS_Raw-I,          OUTPUT=BR:IS-PS{PS:KIC2}E:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC2}E:HVPS-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC2}E:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC2}E:HVPS-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC2}E:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC2}E:HVPS-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC2}E:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1_Raw-I,   OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2_Raw-I,   OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_Raw-I,OUTPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC2}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC2}E:PFN-SP_Ref, CH_TOL=BR:IS-PS{PS:KIC2}E:PFN_SP_Tol-SP, CH_ARCH=BR:IS-PS{PS:KIC2}E:PFN_SP_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:PFN_SP_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC2}E:PFN_SP_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC2}E:PFN_SP_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}E:PFN_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC2}E:PFN_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC2}E:PFN-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:PFN_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC2}E:PFN-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:PFN_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC2}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC2}E:DAC-I_Ref, CH_TOL=BR:IS-PS{PS:KIC2}E:DAC_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC2}E:DAC_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC2}E:DAC_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC2}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC2}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC2}E:DAC-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC2}E:PFN-SP-1k, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC2}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC2}E:PFN-I_Ref, CH_TOL=BR:IS-PS{PS:KIC2}E:PFN_I_Tol-SP, CH_ARCH=BR:IS-PS{PS:KIC2}E:PFN_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:PFN_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC2}E:PFN_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC2}E:PFN_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}E:PFN_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC2}E:PFN_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC2}E:PFN-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:PFN_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC2}E:PFN-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:PFN_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC2}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC2}I:HVPS-I_Ref, CH_TOL=BR:IS-PS{PS:KIC2}I:HVPS_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC2}I:HVPS_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC2}I:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC2}I:HVPS_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC2}I:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}I:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC2}I:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC2}I:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}I:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC2}I:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}I:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC2}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC2}E:HVPS-I_Ref, CH_TOL=BR:IS-PS{PS:KIC2}E:HVPS_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC2}E:HVPS_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC2}E:HVPS_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC2}E:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}E:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC2}E:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC2}E:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC2}E:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I_Ref, CH_TOL=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC2}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:ThyrHeater1_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I_Ref, CH_TOL=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC2}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}E:ThyrHeater2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I_Ref, CH_TOL=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Cmd:RstErr_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:Stdby-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Cmd:Stdby_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Cmd:Stdby_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC2}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:Rdy-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:Rdy_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:Rdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:Rdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:PFNvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Flt:PFNvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Flt:PFNvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:PSUovrheat-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Flt:PSUovrheat_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Flt:PSUovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:BiasPS-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Flt:BiasPS_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Flt:BiasPS_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:BiasPS-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:BiasPS-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PSUcontactor-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:PSUcontactor_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:PSUcontactor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserDoors-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:PulserDoors_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:PulserDoors_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:LocalCtrl-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:LocalCtrl_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:LocalCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:EmergButton_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserHVrly-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Sts:PulserHVrly_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Sts:PulserHVrly_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC2}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR:IS-PS{PS:KIC3} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:IS-PS{PS:KIC3}E:PFN-SP,                              OUTPUT=BR{PSC09}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:00-I,          OUTPUT=BR:IS-PS{PS:KIC3}E:DAC_Raw-I,             WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:01-I,          OUTPUT=BR:IS-PS{PS:KIC3}E:PFN_Raw-I,             WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:02-I,          OUTPUT=BR:IS-PS{PS:KIC3}I:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:03-I,          OUTPUT=BR:IS-PS{PS:KIC3}E:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:04-I,          OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:05-I,          OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC09}ADC:06-I,          OUTPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_Raw-I,  WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC3}Cmd:RstErr-Cmd,                        OUTPUT=BR{PSC09}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC3}Cmd:PwrOn-Cmd,                         OUTPUT=BR{PSC09}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC3}Cmd:Stdby-Cmd,                         OUTPUT=BR{PSC09}DO:2-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:00-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:01-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Flt:PFNvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:02-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Flt:PSUovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:03-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:04-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:05-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:06-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Flt:BiasPS-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:07-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:PSUcontactor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:09-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:PulserDoors-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:10-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:11-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:LocalCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:12-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:13-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:14-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Sts:PulserHVrly-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC09}DI:15-Sts,         OUTPUT=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:IS-PS{PS:KIC3}E:PFN-SP,              OUTPUT=BR:IS-PS{PS:KIC3}E:PFN_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC3}E:PFN_Raw-SP-1k,       OUTPUT=BR:IS-PS{PS:KIC3}E:PFN-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC3}E:PFN-SP-1k-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC3}E:PFN-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC3}E:PFN-SP-1k-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC3}E:PFN-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC3}E:PFN-SP-1k-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC3}E:PFN-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC3}E:DAC_Raw-I,           OUTPUT=BR:IS-PS{PS:KIC3}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC3}E:DAC-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC3}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC3}E:DAC-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC3}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC3}E:DAC-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC3}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC3}E:PFN_Raw-I,           OUTPUT=BR:IS-PS{PS:KIC3}E:PFN-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC3}E:PFN-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC3}E:PFN-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC3}E:PFN-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC3}E:PFN-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC3}E:PFN-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC3}E:PFN-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC3}I:HVPS_Raw-I,          OUTPUT=BR:IS-PS{PS:KIC3}I:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC3}I:HVPS-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC3}I:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC3}I:HVPS-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC3}I:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC3}I:HVPS-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC3}I:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC3}E:HVPS_Raw-I,          OUTPUT=BR:IS-PS{PS:KIC3}E:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC3}E:HVPS-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC3}E:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC3}E:HVPS-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC3}E:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC3}E:HVPS-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC3}E:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1_Raw-I,   OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2_Raw-I,   OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_Raw-I,OUTPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC3}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC3}E:PFN-SP_Ref, CH_TOL=BR:IS-PS{PS:KIC3}E:PFN_SP_Tol-SP, CH_ARCH=BR:IS-PS{PS:KIC3}E:PFN_SP_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:PFN_SP_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC3}E:PFN_SP_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC3}E:PFN_SP_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}E:PFN_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC3}E:PFN_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC3}E:PFN-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:PFN_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC3}E:PFN-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:PFN_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC3}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC3}E:DAC-I_Ref, CH_TOL=BR:IS-PS{PS:KIC3}E:DAC_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC3}E:DAC_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC3}E:DAC_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC3}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC3}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC3}E:DAC-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC3}E:PFN-SP-1k, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC3}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC3}E:PFN-I_Ref, CH_TOL=BR:IS-PS{PS:KIC3}E:PFN_I_Tol-SP, CH_ARCH=BR:IS-PS{PS:KIC3}E:PFN_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:PFN_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC3}E:PFN_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC3}E:PFN_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}E:PFN_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC3}E:PFN_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC3}E:PFN-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:PFN_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC3}E:PFN-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:PFN_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC3}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC3}I:HVPS-I_Ref, CH_TOL=BR:IS-PS{PS:KIC3}I:HVPS_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC3}I:HVPS_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC3}I:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC3}I:HVPS_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC3}I:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}I:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC3}I:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC3}I:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}I:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC3}I:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}I:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC3}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC3}E:HVPS-I_Ref, CH_TOL=BR:IS-PS{PS:KIC3}E:HVPS_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC3}E:HVPS_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC3}E:HVPS_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC3}E:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}E:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC3}E:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC3}E:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC3}E:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I_Ref, CH_TOL=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC3}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:ThyrHeater1_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I_Ref, CH_TOL=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC3}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}E:ThyrHeater2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I_Ref, CH_TOL=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Cmd:RstErr_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:Stdby-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Cmd:Stdby_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:Stdby_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Cmd:Stdby_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:Stdby_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC3}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Cmd:Stdby_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:Rdy-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:Rdy_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:Rdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:Rdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:PFNvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Flt:PFNvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PFNvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Flt:PFNvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PFNvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PFNvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:PSUovrheat-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Flt:PSUovrheat_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PSUovrheat_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Flt:PSUovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PSUovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:PSUovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:BiasPS-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Flt:BiasPS_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Flt:BiasPS_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Flt:BiasPS_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:BiasPS-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:BiasPS_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:BiasPS-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:BiasPS_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PSUcontactor-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:PSUcontactor_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcontactor_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:PSUcontactor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcontactor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PSUcontactor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserDoors-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:PulserDoors_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserDoors_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:PulserDoors_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserDoors_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserDoors_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:LocalCtrl-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:LocalCtrl_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:LocalCtrl_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:LocalCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:LocalCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:LocalCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:EmergButton_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserHVrly-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Sts:PulserHVrly_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserHVrly_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Sts:PulserHVrly_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserHVrly_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC3}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Sts:PulserHVrly_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC3}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR:IS-PS{PS:KIC4} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:IS-PS{PS:KIC4}E:PFN-SP,                              OUTPUT=BR{PSC10}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:00-I,          OUTPUT=BR:IS-PS{PS:KIC4}E:DAC_Raw-I,             WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:01-I,          OUTPUT=BR:IS-PS{PS:KIC4}E:PFN_Raw-I,             WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:02-I,          OUTPUT=BR:IS-PS{PS:KIC4}I:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:03-I,          OUTPUT=BR:IS-PS{PS:KIC4}E:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:04-I,          OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:05-I,          OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC10}ADC:06-I,          OUTPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_Raw-I,  WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC4}Cmd:RstErr-Cmd,                        OUTPUT=BR{PSC10}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC4}Cmd:PwrOn-Cmd,                         OUTPUT=BR{PSC10}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:IS-PS{PS:KIC4}Cmd:Stdby-Cmd,                         OUTPUT=BR{PSC10}DO:2-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:00-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:01-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Flt:PFNvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:02-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Flt:PSUovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:03-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:04-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:05-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:06-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Flt:BiasPS-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:07-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:PSUcontactor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:09-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:PulserDoors-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:10-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:11-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:LocalCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:12-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:13-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:14-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Sts:PulserHVrly-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC10}DI:15-Sts,         OUTPUT=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:IS-PS{PS:KIC4}E:PFN-SP,              OUTPUT=BR:IS-PS{PS:KIC4}E:PFN_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC4}E:PFN_Raw-SP-1k,       OUTPUT=BR:IS-PS{PS:KIC4}E:PFN-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC4}E:PFN-SP-1k-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC4}E:PFN-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC4}E:PFN-SP-1k-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC4}E:PFN-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:PFN-SP-1k,           INDEX=BR:IS-PS{PS:KIC4}E:PFN-SP-1k-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC4}E:PFN-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC4}E:DAC_Raw-I,           OUTPUT=BR:IS-PS{PS:KIC4}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC4}E:DAC-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC4}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC4}E:DAC-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC4}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:DAC-I,               INDEX=BR:IS-PS{PS:KIC4}E:DAC-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC4}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC4}E:PFN_Raw-I,           OUTPUT=BR:IS-PS{PS:KIC4}E:PFN-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC4}E:PFN-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC4}E:PFN-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC4}E:PFN-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC4}E:PFN-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:PFN-I,               INDEX=BR:IS-PS{PS:KIC4}E:PFN-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC4}E:PFN-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC4}I:HVPS_Raw-I,          OUTPUT=BR:IS-PS{PS:KIC4}I:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC4}I:HVPS-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC4}I:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC4}I:HVPS-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC4}I:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}I:HVPS-I,              INDEX=BR:IS-PS{PS:KIC4}I:HVPS-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC4}I:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC4}E:HVPS_Raw-I,          OUTPUT=BR:IS-PS{PS:KIC4}E:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC4}E:HVPS-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC4}E:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC4}E:HVPS-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC4}E:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:HVPS-I,              INDEX=BR:IS-PS{PS:KIC4}E:HVPS-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC4}E:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1_Raw-I,   OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I,       INDEX=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2_Raw-I,   OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I,       INDEX=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_Raw-I,OUTPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I-Slicer-Idx1, OUTPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I-Slicer-Idx2, OUTPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I,    INDEX=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I-Slicer-Idx3, OUTPUT=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC4}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC4}E:PFN-SP_Ref, CH_TOL=BR:IS-PS{PS:KIC4}E:PFN_SP_Tol-SP, CH_ARCH=BR:IS-PS{PS:KIC4}E:PFN_SP_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:PFN_SP_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC4}E:PFN_SP_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC4}E:PFN_SP_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}E:PFN_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC4}E:PFN_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC4}E:PFN-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:PFN_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:PFN-SP, CH_REF=BR:IS-PS{PS:KIC4}E:PFN-SP_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:PFN_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC4}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC4}E:DAC-I_Ref, CH_TOL=BR:IS-PS{PS:KIC4}E:DAC_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC4}E:DAC_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC4}E:DAC_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC4}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC4}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC4}E:DAC-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:DAC-I, CH_REF=BR:IS-PS{PS:KIC4}E:PFN-SP-1k, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC4}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC4}E:PFN-I_Ref, CH_TOL=BR:IS-PS{PS:KIC4}E:PFN_I_Tol-SP, CH_ARCH=BR:IS-PS{PS:KIC4}E:PFN_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:PFN_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC4}E:PFN_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC4}E:PFN_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}E:PFN_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC4}E:PFN_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC4}E:PFN-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:PFN_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:PFN-I, CH_REF=BR:IS-PS{PS:KIC4}E:PFN-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:PFN_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC4}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC4}I:HVPS-I_Ref, CH_TOL=BR:IS-PS{PS:KIC4}I:HVPS_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC4}I:HVPS_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC4}I:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC4}I:HVPS_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC4}I:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}I:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC4}I:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC4}I:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}I:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}I:HVPS-I, CH_REF=BR:IS-PS{PS:KIC4}I:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}I:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC4}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC4}E:HVPS-I_Ref, CH_TOL=BR:IS-PS{PS:KIC4}E:HVPS_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC4}E:HVPS_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC4}E:HVPS_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC4}E:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}E:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC4}E:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC4}E:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:HVPS-I, CH_REF=BR:IS-PS{PS:KIC4}E:HVPS-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I_Ref, CH_TOL=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I, CH_REF=BR:IS-PS{PS:KIC4}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:ThyrHeater1_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I_Ref, CH_TOL=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I, CH_REF=BR:IS-PS{PS:KIC4}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}E:ThyrHeater2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I_Ref, CH_TOL=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_Tol-SP,  CH_ARCH=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_Arch-I, CH_DIFFREF=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_DiffRef-I, CH_DIFFARCH=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_DiffArch-I, CH_FLG=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I, CH_REF=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Cmd:RstErr_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Cmd:RstErr-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Cmd:PwrOn-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:Stdby-Cmd_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Cmd:Stdby_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:Stdby_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Cmd:Stdby_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:Stdby_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Cmd:Stdby-Cmd, CH_REF=BR:IS-PS{PS:KIC4}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Cmd:Stdby_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:Rdy-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:Rdy_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:Rdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:Rdy-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:Rdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:PFNvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Flt:PFNvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PFNvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Flt:PFNvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PFNvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:PFNvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PFNvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:PSUovrheat-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Flt:PSUovrheat_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PSUovrheat_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Flt:PSUovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PSUovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:PSUovrheat-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:PSUovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:BiasPS-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Flt:BiasPS_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Flt:BiasPS_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Flt:BiasPS_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:BiasPS-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:BiasPS_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:BiasPS-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:BiasPS-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:BiasPS_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PSUcontactor-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:PSUcontactor_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcontactor_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:PSUcontactor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcontactor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PSUcontactor-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PSUcontactor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserDoors-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:PulserDoors_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserDoors_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:PulserDoors_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserDoors_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PulserDoors-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserDoors_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:LocalCtrl-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:LocalCtrl_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:LocalCtrl_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:LocalCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:LocalCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:LocalCtrl-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:LocalCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:EmergButton_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:EmergButton-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:EmergButton-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:ExtInterlock-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserHVrly-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Sts:PulserHVrly_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserHVrly_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Sts:PulserHVrly_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserHVrly_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Sts:PulserHVrly-Sts, CH_REF=BR:IS-PS{PS:KIC4}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Sts:PulserHVrly_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage-Sts_Ref, CH_ARCH=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage_Arch-Sts, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage-Sts, CH_REF=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:IS-PS{PS:KIC4}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR:XS-PS{PS:KIC1} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:XS-PS{PS:KIC1}E:PFN-SP,                              OUTPUT=BR{PSC11}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:00-I,          OUTPUT=BR:XS-PS{PS:KIC1}E:DAC_Raw-I,             WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:01-I,          OUTPUT=BR:XS-PS{PS:KIC1}E:PFN_Raw-I,             WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:02-I,          OUTPUT=BR:XS-PS{PS:KIC1}I:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:03-I,          OUTPUT=BR:XS-PS{PS:KIC1}E:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:04-I,          OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:05-I,          OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC11}ADC:06-I,          OUTPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_Raw-I,  WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:KIC1}Cmd:RstErr-Cmd,                        OUTPUT=BR{PSC11}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:KIC1}Cmd:PwrOn-Cmd,                         OUTPUT=BR{PSC11}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:KIC1}Cmd:Stdby-Cmd,                         OUTPUT=BR{PSC11}DO:2-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:00-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:01-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Flt:PFNvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:02-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Flt:PSUovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:03-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:04-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:05-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:06-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Flt:BiasPS-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:07-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:PSUcontactor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:09-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:PulserDoors-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:10-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:11-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:LocalCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:12-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:13-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:14-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Sts:PulserHVrly-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC11}DI:15-Sts,         OUTPUT=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:XS-PS{PS:KIC1}E:PFN-SP,              OUTPUT=BR:XS-PS{PS:KIC1}E:PFN_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC1}E:PFN_Raw-SP-1k,       OUTPUT=BR:XS-PS{PS:KIC1}E:PFN-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:PFN-SP-1k,           INDEX=BR:XS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:PFN-SP-1k,           INDEX=BR:XS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:PFN-SP-1k,           INDEX=BR:XS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC1}E:PFN-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC1}E:DAC_Raw-I,           OUTPUT=BR:XS-PS{PS:KIC1}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:DAC-I,               INDEX=BR:XS-PS{PS:KIC1}E:DAC-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC1}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:DAC-I,               INDEX=BR:XS-PS{PS:KIC1}E:DAC-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC1}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:DAC-I,               INDEX=BR:XS-PS{PS:KIC1}E:DAC-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC1}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC1}E:PFN_Raw-I,           OUTPUT=BR:XS-PS{PS:KIC1}E:PFN-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:PFN-I,               INDEX=BR:XS-PS{PS:KIC1}E:PFN-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC1}E:PFN-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:PFN-I,               INDEX=BR:XS-PS{PS:KIC1}E:PFN-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC1}E:PFN-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:PFN-I,               INDEX=BR:XS-PS{PS:KIC1}E:PFN-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC1}E:PFN-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC1}I:HVPS_Raw-I,          OUTPUT=BR:XS-PS{PS:KIC1}I:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}I:HVPS-I,              INDEX=BR:XS-PS{PS:KIC1}I:HVPS-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC1}I:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}I:HVPS-I,              INDEX=BR:XS-PS{PS:KIC1}I:HVPS-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC1}I:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}I:HVPS-I,              INDEX=BR:XS-PS{PS:KIC1}I:HVPS-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC1}I:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC1}E:HVPS_Raw-I,          OUTPUT=BR:XS-PS{PS:KIC1}E:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:HVPS-I,              INDEX=BR:XS-PS{PS:KIC1}E:HVPS-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC1}E:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:HVPS-I,              INDEX=BR:XS-PS{PS:KIC1}E:HVPS-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC1}E:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:HVPS-I,              INDEX=BR:XS-PS{PS:KIC1}E:HVPS-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC1}E:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1_Raw-I,   OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I,       INDEX=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I,       INDEX=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I,       INDEX=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2_Raw-I,   OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I,       INDEX=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I,       INDEX=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I,       INDEX=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_Raw-I,OUTPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I,    INDEX=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I,    INDEX=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I,    INDEX=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC1}E:PFN-SP, CH_REF=BR:XS-PS{PS:KIC1}E:PFN-SP_Ref, CH_TOL=BR:XS-PS{PS:KIC1}E:PFN_SP_Tol-SP, CH_ARCH=BR:XS-PS{PS:KIC1}E:PFN_SP_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:PFN_SP_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC1}E:PFN_SP_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC1}E:PFN_SP_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}E:PFN_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC1}E:PFN_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:PFN-SP, CH_REF=BR:XS-PS{PS:KIC1}E:PFN-SP_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:PFN_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:PFN-SP, CH_REF=BR:XS-PS{PS:KIC1}E:PFN-SP_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:PFN_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC1}E:DAC-I, CH_REF=BR:XS-PS{PS:KIC1}E:DAC-I_Ref, CH_TOL=BR:XS-PS{PS:KIC1}E:DAC_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC1}E:DAC_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC1}E:DAC_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC1}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC1}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:DAC-I, CH_REF=BR:XS-PS{PS:KIC1}E:DAC-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:DAC-I, CH_REF=BR:XS-PS{PS:KIC1}E:PFN-SP-1k, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC1}E:PFN-I, CH_REF=BR:XS-PS{PS:KIC1}E:PFN-I_Ref, CH_TOL=BR:XS-PS{PS:KIC1}E:PFN_I_Tol-SP, CH_ARCH=BR:XS-PS{PS:KIC1}E:PFN_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:PFN_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC1}E:PFN_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC1}E:PFN_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}E:PFN_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC1}E:PFN_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:PFN-I, CH_REF=BR:XS-PS{PS:KIC1}E:PFN-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:PFN_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:PFN-I, CH_REF=BR:XS-PS{PS:KIC1}E:PFN-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:PFN_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC1}I:HVPS-I, CH_REF=BR:XS-PS{PS:KIC1}I:HVPS-I_Ref, CH_TOL=BR:XS-PS{PS:KIC1}I:HVPS_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC1}I:HVPS_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC1}I:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC1}I:HVPS_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC1}I:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}I:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC1}I:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}I:HVPS-I, CH_REF=BR:XS-PS{PS:KIC1}I:HVPS-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}I:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}I:HVPS-I, CH_REF=BR:XS-PS{PS:KIC1}I:HVPS-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}I:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC1}E:HVPS-I, CH_REF=BR:XS-PS{PS:KIC1}E:HVPS-I_Ref, CH_TOL=BR:XS-PS{PS:KIC1}E:HVPS_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC1}E:HVPS_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC1}E:HVPS_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC1}E:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}E:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC1}E:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:HVPS-I, CH_REF=BR:XS-PS{PS:KIC1}E:HVPS-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:HVPS-I, CH_REF=BR:XS-PS{PS:KIC1}E:HVPS-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I, CH_REF=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I_Ref, CH_TOL=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I, CH_REF=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I, CH_REF=BR:XS-PS{PS:KIC1}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:ThyrHeater1_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I, CH_REF=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I_Ref, CH_TOL=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I, CH_REF=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I, CH_REF=BR:XS-PS{PS:KIC1}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}E:ThyrHeater2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I, CH_REF=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I_Ref, CH_TOL=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I, CH_REF=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I, CH_REF=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Cmd:RstErr_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Cmd:Stdby-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:Stdby-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Cmd:Stdby_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Cmd:Stdby_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Cmd:Stdby-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Cmd:Stdby-Cmd, CH_REF=BR:XS-PS{PS:KIC1}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Cmd:Stdby_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:Rdy-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:Rdy-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:Rdy_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:Rdy-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:Rdy-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:Rdy-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:Rdy-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Flt:PFNvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:PFNvoltage-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Flt:PFNvoltage_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Flt:PFNvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:PFNvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:PFNvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PFNvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Flt:PSUovrheat-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:PSUovrheat-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Flt:PSUovrheat_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Flt:PSUovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:PSUovrheat-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:PSUovrheat-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:PSUovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Flt:BiasPS-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:BiasPS-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Flt:BiasPS_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Flt:BiasPS_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:BiasPS-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:BiasPS-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:BiasPS-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:BiasPS-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:BiasPS_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:PSUcontactor-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PSUcontactor-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:PSUcontactor_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:PSUcontactor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PSUcontactor-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PSUcontactor-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PSUcontactor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:PulserDoors-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserDoors-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:PulserDoors_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:PulserDoors_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PulserDoors-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PulserDoors-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserDoors_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:LocalCtrl-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:LocalCtrl-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:LocalCtrl_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:LocalCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:LocalCtrl-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:LocalCtrl-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:LocalCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:EmergButton_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:EmergButton-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:ExtInterlock-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:ExtInterlock-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:ExtInterlock-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Sts:PulserHVrly-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserHVrly-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Sts:PulserHVrly_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Sts:PulserHVrly_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PulserHVrly-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Sts:PulserHVrly-Sts, CH_REF=BR:XS-PS{PS:KIC1}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Sts:PulserHVrly_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC1}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")


# BR:XS-PS{PS:KIC2} Power Supply begins here
dbLoadRecords("db/Ch-WfOut-Coeff.db", "INPUT=BR:XS-PS{PS:KIC2}E:PFN-SP,                              OUTPUT=BR{PSC12}DAC:0-SP,    WF_LENGTH=10150")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:00-I,          OUTPUT=BR:XS-PS{PS:KIC2}E:DAC_Raw-I,             WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:01-I,          OUTPUT=BR:XS-PS{PS:KIC2}E:PFN_Raw-I,             WF_LENGTH=1014")

dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:02-I,          OUTPUT=BR:XS-PS{PS:KIC2}I:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:03-I,          OUTPUT=BR:XS-PS{PS:KIC2}E:HVPS_Raw-I,            WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:04-I,          OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:05-I,          OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2_Raw-I,     WF_LENGTH=1014")
dbLoadRecords("db/Ch-WfIn-Coeff.db",  "INPUT=BR{PSC12}ADC:06-I,          OUTPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_Raw-I,  WF_LENGTH=1014")

dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:KIC2}Cmd:RstErr-Cmd,                        OUTPUT=BR{PSC12}DO:0-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:KIC2}Cmd:PwrOn-Cmd,                         OUTPUT=BR{PSC12}DO:1-Cmd")
dbLoadRecords("db/Ch-DOut.db",        "INPUT=BR:XS-PS{PS:KIC2}Cmd:Stdby-Cmd,                         OUTPUT=BR{PSC12}DO:2-Cmd")

dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:00-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:Rdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:01-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Flt:PFNvoltage-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:02-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Flt:PSUovrheat-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:03-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:04-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:05-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:06-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Flt:BiasPS-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:07-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:PSUcontactor-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:09-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:PulserDoors-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:10-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:11-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:LocalCtrl-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:12-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:EmergButton-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:13-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:ExtInterlock-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:14-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Sts:PulserHVrly-Sts")
dbLoadRecords("db/Ch-DIn.db",         "INPUT=BR{PSC12}DI:15-Sts,         OUTPUT=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts")

dbLoadRecords("db/Subsampling.db",    "INPUT=BR:XS-PS{PS:KIC2}E:PFN-SP,              OUTPUT=BR:XS-PS{PS:KIC2}E:PFN_Raw-SP-1k, WF_LENGTH=10150, WF_LENGTH2=1014, DIVIDER=10")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC2}E:PFN_Raw-SP-1k,       OUTPUT=BR:XS-PS{PS:KIC2}E:PFN-SP-1k, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:PFN-SP-1k,           INDEX=BR:XS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:PFN-SP-1k,           INDEX=BR:XS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:PFN-SP-1k,           INDEX=BR:XS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC2}E:PFN-SP-1k-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC2}E:DAC_Raw-I,           OUTPUT=BR:XS-PS{PS:KIC2}E:DAC-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:DAC-I,               INDEX=BR:XS-PS{PS:KIC2}E:DAC-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC2}E:DAC-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:DAC-I,               INDEX=BR:XS-PS{PS:KIC2}E:DAC-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC2}E:DAC-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:DAC-I,               INDEX=BR:XS-PS{PS:KIC2}E:DAC-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC2}E:DAC-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC2}E:PFN_Raw-I,           OUTPUT=BR:XS-PS{PS:KIC2}E:PFN-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:PFN-I,               INDEX=BR:XS-PS{PS:KIC2}E:PFN-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC2}E:PFN-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:PFN-I,               INDEX=BR:XS-PS{PS:KIC2}E:PFN-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC2}E:PFN-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:PFN-I,               INDEX=BR:XS-PS{PS:KIC2}E:PFN-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC2}E:PFN-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC2}I:HVPS_Raw-I,          OUTPUT=BR:XS-PS{PS:KIC2}I:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}I:HVPS-I,              INDEX=BR:XS-PS{PS:KIC2}I:HVPS-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC2}I:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}I:HVPS-I,              INDEX=BR:XS-PS{PS:KIC2}I:HVPS-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC2}I:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}I:HVPS-I,              INDEX=BR:XS-PS{PS:KIC2}I:HVPS-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC2}I:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC2}E:HVPS_Raw-I,          OUTPUT=BR:XS-PS{PS:KIC2}E:HVPS-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:HVPS-I,              INDEX=BR:XS-PS{PS:KIC2}E:HVPS-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC2}E:HVPS-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:HVPS-I,              INDEX=BR:XS-PS{PS:KIC2}E:HVPS-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC2}E:HVPS-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:HVPS-I,              INDEX=BR:XS-PS{PS:KIC2}E:HVPS-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC2}E:HVPS-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1_Raw-I,   OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I,       INDEX=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I,       INDEX=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I,       INDEX=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2_Raw-I,   OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I,       INDEX=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I,       INDEX=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I,       INDEX=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/Average.db",        "INPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_Raw-I,OUTPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I,    INDEX=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Idx1, OUTPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Val1, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I,    INDEX=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Idx2, OUTPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Val2, DOL=, OMSL=supervisory, WF_LENGTH=1014")
dbLoadRecords("db/Slicer2.db",        "INPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I,    INDEX=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Idx3, OUTPUT=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I-Slicer-Val3, DOL=, OMSL=supervisory, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC2}E:PFN-SP, CH_REF=BR:XS-PS{PS:KIC2}E:PFN-SP_Ref, CH_TOL=BR:XS-PS{PS:KIC2}E:PFN_SP_Tol-SP, CH_ARCH=BR:XS-PS{PS:KIC2}E:PFN_SP_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:PFN_SP_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC2}E:PFN_SP_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC2}E:PFN_SP_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}E:PFN_SP_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC2}E:PFN_SP_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:PFN-SP, CH_REF=BR:XS-PS{PS:KIC2}E:PFN-SP_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:PFN_SP_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=10150")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:PFN-SP, CH_REF=BR:XS-PS{PS:KIC2}E:PFN-SP_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:PFN_SP_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:PFN_SP_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=10150")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC2}E:DAC-I, CH_REF=BR:XS-PS{PS:KIC2}E:DAC-I_Ref, CH_TOL=BR:XS-PS{PS:KIC2}E:DAC_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC2}E:DAC_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:DAC_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC2}E:DAC_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC2}E:DAC_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}E:DAC_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC2}E:DAC_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:DAC-I, CH_REF=BR:XS-PS{PS:KIC2}E:DAC-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:DAC_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:DAC-I, CH_REF=BR:XS-PS{PS:KIC2}E:PFN-SP-1k, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:DAC_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:DAC_I_MonitFlg-Sts, MODE=1, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC2}E:PFN-I, CH_REF=BR:XS-PS{PS:KIC2}E:PFN-I_Ref, CH_TOL=BR:XS-PS{PS:KIC2}E:PFN_I_Tol-SP, CH_ARCH=BR:XS-PS{PS:KIC2}E:PFN_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:PFN_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC2}E:PFN_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC2}E:PFN_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}E:PFN_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC2}E:PFN_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:PFN-I, CH_REF=BR:XS-PS{PS:KIC2}E:PFN-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:PFN_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:PFN-I, CH_REF=BR:XS-PS{PS:KIC2}E:PFN-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:PFN_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:PFN_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC2}I:HVPS-I, CH_REF=BR:XS-PS{PS:KIC2}I:HVPS-I_Ref, CH_TOL=BR:XS-PS{PS:KIC2}I:HVPS_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC2}I:HVPS_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC2}I:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC2}I:HVPS_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC2}I:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}I:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC2}I:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}I:HVPS-I, CH_REF=BR:XS-PS{PS:KIC2}I:HVPS-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}I:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}I:HVPS-I, CH_REF=BR:XS-PS{PS:KIC2}I:HVPS-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}I:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}I:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC2}E:HVPS-I, CH_REF=BR:XS-PS{PS:KIC2}E:HVPS-I_Ref, CH_TOL=BR:XS-PS{PS:KIC2}E:HVPS_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC2}E:HVPS_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:HVPS_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC2}E:HVPS_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC2}E:HVPS_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}E:HVPS_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC2}E:HVPS_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:HVPS-I, CH_REF=BR:XS-PS{PS:KIC2}E:HVPS-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:HVPS_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:HVPS-I, CH_REF=BR:XS-PS{PS:KIC2}E:HVPS-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:HVPS_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:HVPS_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I, CH_REF=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I_Ref, CH_TOL=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I, CH_REF=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I, CH_REF=BR:XS-PS{PS:KIC2}E:ThyrHeater1-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:ThyrHeater1_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I, CH_REF=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I_Ref, CH_TOL=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I, CH_REF=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I, CH_REF=BR:XS-PS{PS:KIC2}E:ThyrHeater2-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}E:ThyrHeater2_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitWfCommon.db", "CH=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I, CH_REF=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I_Ref, CH_TOL=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_Tol-SP,  CH_ARCH=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_Arch-I, CH_DIFFREF=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_DiffRef-I, CH_DIFFARCH=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_DiffArch-I, CH_FLG=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_COEFF=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_MonitCoeff-SP, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I, CH_REF=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=2, ENABLED=1, DATA_TYPE=FLOAT, WF_LENGTH=1014")
dbLoadRecords("db/MonitWf.db",  "CH=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I, CH_REF=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr-I_Ref, CH_DIFFREF=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_DiffRef-I, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}I:ThyrAuxArcCurr_I_MonitFlg-Sts, MODE=1, ENABLED=0, DATA_TYPE=FLOAT, WF_LENGTH=1014")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:RstErr-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Cmd:RstErr_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Cmd:RstErr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Cmd:RstErr-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:RstErr-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:RstErr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:PwrOn-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Cmd:PwrOn_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Cmd:PwrOn_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Cmd:PwrOn-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:PwrOn-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:PwrOn_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Cmd:Stdby-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:Stdby-Cmd_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Cmd:Stdby_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Cmd:Stdby_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Cmd:Stdby-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Cmd:Stdby-Cmd, CH_REF=BR:XS-PS{PS:KIC2}Cmd:Stdby-Cmd_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Cmd:Stdby_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:Rdy-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:Rdy-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:Rdy_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:Rdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:Rdy-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:Rdy-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:Rdy-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:Rdy-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:Rdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Flt:PFNvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:PFNvoltage-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Flt:PFNvoltage_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Flt:PFNvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:PFNvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:PFNvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:PFNvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PFNvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Flt:PSUovrheat-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:PSUovrheat-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Flt:PSUovrheat_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Flt:PSUovrheat_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:PSUovrheat-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:PSUovrheat-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:PSUovrheat-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:PSUovrheat_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrcurr_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:TrigUnitRdy_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Flt:BiasPS-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:BiasPS-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Flt:BiasPS_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Flt:BiasPS_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:BiasPS-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:BiasPS-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:BiasPS-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:BiasPS-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:BiasPS_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:PSUcontactor-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PSUcontactor-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:PSUcontactor_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:PSUcontactor_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PSUcontactor-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PSUcontactor-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PSUcontactor-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PSUcontactor_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:PulserDoors-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserDoors-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:PulserDoors_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:PulserDoors_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PulserDoors-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PulserDoors-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserDoors-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserDoors_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserCircBreaker_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:LocalCtrl-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:LocalCtrl-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:LocalCtrl_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:LocalCtrl_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:LocalCtrl-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:LocalCtrl-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:LocalCtrl-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:LocalCtrl_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:EmergButton-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:EmergButton_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:EmergButton_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:EmergButton-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:EmergButton-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:EmergButton-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:EmergButton_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:ExtInterlock-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:ExtInterlock-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:ExtInterlock_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:ExtInterlock_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:ExtInterlock-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:ExtInterlock-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:ExtInterlock-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:ExtInterlock_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Sts:PulserHVrly-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserHVrly-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Sts:PulserHVrly_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Sts:PulserHVrly_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PulserHVrly-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Sts:PulserHVrly-Sts, CH_REF=BR:XS-PS{PS:KIC2}Sts:PulserHVrly-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Sts:PulserHVrly_MonitFlg-Sts, MODE=1, ENABLED=0")

dbLoadRecords("db/MonitBinaryCommon.db", "CH=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts_Ref, CH_ARCH=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage_Arch-Sts, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, CH_FLGARCH=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage_ArchFlg-Sts, MODE_PV=BR{}MonitMode-Sel")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=2, ENABLED=1")
dbLoadRecords("db/MonitBinary.db",       "CH=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts, CH_REF=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage-Sts_Ref, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE_PV=BR{}MonitMode-Sel, CH_FLG=BR:XS-PS{PS:KIC2}Flt:HVPSovrvoltage_MonitFlg-Sts, MODE=1, ENABLED=0")


var(PSCDebug, 1)
#with debug message: var(PSCDebug, 2)

#Tx socket
createPSC("TxPSC07", "br-psc07", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC07", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC07", "br-psc07", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC07", 80, 128)

#Tx socket
createPSC("TxPSC08", "br-psc08", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC08", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC08", "br-psc08", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC08", 80, 128)

#Tx socket
createPSC("TxPSC09", "br-psc09", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC09", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC09", "br-psc09", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC09", 80, 128)

#Tx socket
createPSC("TxPSC10", "br-psc10", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC10", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC10", "br-psc10", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC10", 80, 128)

#Tx socket
createPSC("TxPSC11", "br-psc11", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC11", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC11", "br-psc11", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC11", 80, 128)

#Tx socket
createPSC("TxPSC12", "br-psc12", 7, 0)
epicsThreadSleep 0.1
#Tx sim socket
#createPSC("TxPSC12", "localhost", 8765, 0)
#Rx socket
createPSC("RxPSC12", "br-psc12", 20, 1)
epicsThreadSleep 0.1
setPSCSendBlockSize("TxPSC12", 80, 128)

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

