#!../../bin/linux-x86_64/psc

< ../../CONFIG.txt	

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "50000000")

##**Register all support components
dbLoadDatabase("../../dbd/psc.dbd",0,0)
psc_registerRecordDeviceDriver(pdbbase) 

#**Load record instances
dbLoadRecords("../../db/xbpm_sydor.db", "DEVICE_NAME=$(DEVICE_NAME), ADC_WFM_LEN=102400, FA_WFM_LEN=131072")

#**PSC Settings
var(PSCDebug, 2)	#5 full debug
createPSC("aie_tx_$(DEVICE_NAME)", $(XBPM_IP), 7, 0)
createPSC("aie_wfm_rx_$(DEVICE_NAME)", $(XBPM_IP), 20, 1)
createPSC("Rx$(DEVICE_NAME)", $(XBPM_IP), 600, 1)

#**Autosave Settings
set_requestfile_path("../../autosave")
set_savefile_path("../../autosave")
set_pass1_restoreFile("ab_pid.sav")

#**IOC Initialization
iocInit()

#**Autosave Monitor
create_monitor_set("ab_pid.req", 15, "DEVICE_NAME=$(DEVICE_NAME)")

#**Initialization Start
dbpf $(DEVICE_NAME)Leds-SP 16776216
dbpf $(DEVICE_NAME)IPADDR-I $(XBPM_IP)
dbpf $(DEVICE_NAME)SERIAL-I $(SERIAL_NUMBER)

#**Load defaults
< default_init.txt

#**Load calibrations
< Calibrations/calibration_siepa3p_sn$(SERIAL_NUMBER).txt		

#**Set Gain
dbpf $(DEVICE_NAME)Gain:Level-SP 4

#**Initialization Complete
dbpf $(DEVICE_NAME)Leds-SP 11184496
epicsThreadSleep 1
dbpf $(DEVICE_NAME)Leds-SP 16776216
epicsThreadSleep 1
dbpf $(DEVICE_NAME)Leds-SP 0
dbpf $(DEVICE_NAME)IntBias:Pol-SP 0

#
#******************************************************************************
#			ELECTROMETER INITIALIZATION COMPLETE
#******************************************************************************
