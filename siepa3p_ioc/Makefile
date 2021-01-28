#Makefile at top of application tree
TOP = .
include $(TOP)/configure/CONFIG
DIRS := $(DIRS) $(filter-out $(DIRS), configure)
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *App))
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard iocBoot))

define DIR_template
 $(1)_DEPEND_DIRS = configure
endef
$(foreach dir, $(filter-out configure,$(DIRS)),$(eval $(call DIR_template,$(dir))))

iocBoot_DEPEND_DIRS += $(filter %App,$(DIRS))
pscApp_DEPEND_DIRS += waveANLApp

include $(TOP)/configure/RULES_TOP

ARCH := $(shell getconf LONG_BIT)
BOOTDIR := iocBoot/iocbpm
ifeq ($(ARCH),64)
  BOOTARCH := linux-x86_64
  $(info $(BOOTARCH) detected) 
 
else	
  BOOTARCH := linux-x86
  $(info $(BOOTARCH) detected) 

endif

$(shell sed -i '1c#!../../bin/$(BOOTARCH)/psc' $(BOOTDIR)/st.cmd)

clean:
	rm -rf lib bin db dbd include
clean_autosave:
	rm -r autosave/*sav*
