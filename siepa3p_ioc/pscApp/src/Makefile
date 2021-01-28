TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = psc
LIBRARY_IOC = fdbkseq

# psc.dbd will be created and installed
DBD += psc.dbd

# psc.dbd will be made up from these files:
psc_DBD += base.dbd
psc_DBD += pscdrv.dbd
psc_DBD += slicer2.dbd
psc_DBD += subCalcAlarm.dbd


# Add all the support libraries needed by this IOC
#psc_LIBS += xxx

# psc_registerRecordDeviceDriver.cpp derives from psc.dbd
psc_SRCS += psc_registerRecordDeviceDriver.cpp

USR_CXXFLAGS_DEFAULT += -fno-operator-names
USR_CXXFLAGS_DEFAULT += -pedantic

psc_SRCS += evbase.cpp
psc_SRCS += psc.cpp
psc_SRCS += pscwrap.cpp
psc_SRCS += util.c
psc_SRCS += devcommon.cpp
psc_SRCS += devPSCString.cpp
psc_SRCS += devPSCWf.cpp
psc_SRCS += devPSCReg.cpp
psc_SRCS += devPSCSingle.cpp
psc_SRCS += devPSCCtrl.cpp

psc_SRCS += psctbl.cpp

psc_SRCS += aSubOperations.cpp

psc_SRCS += slicer2.c
#bpms
psc_SRCS += posPolyCoeffCal.c
psc_SRCS += saRmsCal.c
psc_SRCS += saStdCal.c
psc_SRCS += bpm_aSubUtils.c
psc_SRCS += subCalcAlarm.c
#psc_SRCS += bpm_aSub_fft.c


# Build the main IOC entry point on workstation OSs.
psc_SRCS_DEFAULT += pscMain.cpp
psc_SRCS_vxWorks += -nil-

# Math
psc_SYS_LIBS += gsl gslcblas m

# Save/restore
psc_DBD  += asSupport.dbd
psc_LIBS += autosave


# bpm
psc_DBD  += waveAnlRecord.dbd
psc_LIBS += waveAnl
#psc_LIBS += sigLib

# For Channel Finder
psc_DBD += system.dbd

# For other stuff
psc_DBD +=  devIocStats.dbd
psc_DBD +=  caPutLog.dbd
psc_LIBS += devIocStats
psc_LIBS += caPutLog
psc_SNCFLAGS += +r
psc_DBD += fdbk.dbd
fdbkseq_SRCS += fdbk.st
fdbkseq_LIBS += seq pv
psc_LIBS += seq pv fdbkseq


# Add support from base/src/vxWorks if needed
#psc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
psc_LIBS += $(EPICS_BASE_IOC_LIBS)

psc_SYS_LIBS += event_core event_extra

ifeq ($(POSIX),YES)
psc_SYS_LIBS += event_pthreads
endif

ifneq ($(LIBEVENT),)
LDFLAGS += -L$(LIBEVENT)/lib
CPPFLAGS += -I$(LIBEVENT)/include
endif

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

