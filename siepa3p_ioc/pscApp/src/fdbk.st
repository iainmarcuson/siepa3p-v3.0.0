program fdbkseq
int pv_fdbk_status[2];
assign pv_fdbk_status[0] to "{DEVICE_NAME}Fdbk:AEn-SP";
assign pv_fdbk_status[1] to "{DEVICE_NAME}Fdbk:BEn-SP";
monitor pv_fdbk_status;
evflag ef_fdbk_status;
int pv_fdbk_reenable;
assign pv_fdbk_reenable to "{DEVICE_NAME}Fdbk:Reenable";
int fdbk_status_latched[2];
int i,j,k;
int pv_fdbk_disable[3];
assign pv_fdbk_disable[0] to "{DEVICE_NAME}Fdbk:SigHigh";
assign pv_fdbk_disable[1] to "{DEVICE_NAME}Fdbk:AEn-SP";
assign pv_fdbk_disable[2] to "{DEVICE_NAME}Fdbk:BEn-SP";
monitor pv_fdbk_disable;
evflag ef_fdbk_disable;
sync pv_fdbk_disable ef_fdbk_disable;

// pv_lvds_status reads the LVDS input PV (0) and the LVDS enable PV (1)
int pv_lvds_status[4];
assign pv_lvds_status[0] to "{DEVICE_NAME}Lvds:In_1";
assign pv_lvds_status[1] to "{DEVICE_NAME}Fdbk:LvdsEn";
assign pv_lvds_status[2] to "{DEVICE_NAME}Fdbk:AEn-SP";
assign pv_lvds_status[3] to "{DEVICE_NAME}Fdbk:BEn-SP";
monitor pv_lvds_status;
evflag ef_lvds_status;
sync pv_lvds_status ef_lvds_status;
int lvds_fdbk_latch[2];

int pv_lvds_disable[4];
assign pv_lvds_disable[0] to "{DEVICE_NAME}Lvds:In_1";
assign pv_lvds_disable[1] to "{DEVICE_NAME}Fdbk:LvdsEn";
assign pv_lvds_disable[2] to "{DEVICE_NAME}Fdbk:AEn-SP";
assign pv_lvds_disable[3] to "{DEVICE_NAME}Fdbk:BEn-SP";
monitor pv_lvds_disable;
evflag ef_lvds_disable;
sync pv_lvds_disable ef_lvds_disable;

ss feedback_disable {
   state init {
   	 entry {
	       for (i=0; i<2; i++)
	       {
		pvGet(pv_fdbk_status[i]);
		fdbk_status_latched[i] = pv_fdbk_status[i];
		}

		pvGet(pv_fdbk_disable[0]);
	}
   	 when ((pv_fdbk_disable[0]!=0))
	 {
		//Signal is high
	} state sig_high
	when ((pv_fdbk_disable[0]==0))
	{
		//Signal is low
	} state sig_low
	}
   state sig_low {
   	 entry {
	       //Force feedback to zero
	       pv_fdbk_disable[1] = 0;
	       pv_fdbk_disable[2] = 0;
	       pvPut(pv_fdbk_disable[1]);
	       pvPut(pv_fdbk_disable[2]);
	       }
  	 when (efTest(ef_fdbk_disable) && (pv_fdbk_disable[0] == 0))
	 {
		//Signal is still low, so zero out feedback
		for (i=1; i<3; i++)
		{
			pv_fdbk_disable[i] = 0;
			pvPut(pv_fdbk_disable[i]);
		}

		efClear(ef_fdbk_disable);
		printf("Feedback vars changed, but signal too low.\n");
	 } state sig_low
	 when (efTest(ef_fdbk_disable) && (pv_fdbk_disable[0] != 0))
	 {
		//Signal is high, so transition to sig_high
		//TODO Add in latching
		efClear(ef_fdbk_disable);
		printf("Signal high again.\n");
	} state sig_high
	}
    state sig_high {
    	  entry {
	  	pvGet(pv_fdbk_reenable);
	  	for (i=0; i<2; i++)
		{
			pv_fdbk_status[i] = fdbk_status_latched[i] && pv_fdbk_reenable;
			pvPut(pv_fdbk_status[i]);
		}
	}
	when (efTest(ef_fdbk_disable) && (pv_fdbk_disable[0]==0))
	{
		//Signal has gone low, so switch to sig_low
		//First latch the present feedback data
		//Set latch to zero if Automatic Reenable deasserted
		pvGet(pv_fdbk_reenable);

		//Handle signal going low during LVDS high
		pvGet(pv_lvds_status[0]);
		pvGet(pv_lvds_status[1]);

		if (pv_lvds_status[0] && pv_lvds_status[1])
		{
			//LVDS is disabling feedback
			//Latch the values LVDS has saved
			for (i=0; i<2; i++)
			{
				fdbk_status_latched[i] = lvds_fdbk_latch[i];
			}
		}
		else
		{
			for (i=0; i<2; i++)
			{
				pvGet(pv_fdbk_status[i]);
					fdbk_status_latched[i] = (pv_fdbk_status[i]) && pv_fdbk_reenable;
			}
			efClear(ef_fdbk_disable);
		}
	} state sig_low
	}
}

ss lvds_latch {
   state init {
   	 entry {
	       for (j=0; j<2; j++)
	       {
	       	       pvGet(pv_lvds_status[j]);
		       lvds_fdbk_latch[j] = 0; //Initialize latch to zero
		}
		
	 }
	 when (pv_lvds_status[0]==0)
	      {
	      } state lvds_low
	 when (pv_lvds_status[0]!=0)
	      {
	      } state lvds_high
	 }
   state lvds_low {
   	 when ( efTest(ef_lvds_status) && (pv_lvds_status[0]!=0))
	 {
		//Transitioning to disable
		efClear(ef_lvds_status);
		pvGet(pv_lvds_status[1]);
		pvGet(pv_fdbk_reenable);
		pvGet(pv_fdbk_disable[0]);
		if (pv_lvds_status[1]!=0)
		{
			if(pv_fdbk_reenable && (pv_fdbk_disable[0]==0))
			{
				//Signal is currently below threshold
				//So latch values that were saved for threshold
				for (j=0; j<2; j++)
				{
					lvds_fdbk_latch[j] = fdbk_status_latched[j];
				}
			}
			else
			{
				//Enabled, so latch the feedback values
	 			for (j=0; j<2; j++)
				{
					pvGet(pv_fdbk_status[j]);
					lvds_fdbk_latch[j] = pv_fdbk_status[j];
				}
			}
		}
	} state lvds_high
	when (efTest(ef_lvds_status) && (pv_lvds_status[0]==0))
	{
		efClear(ef_lvds_status);
	} state lvds_low
	}
    state lvds_high {
    	entry {
	      //Be sure to clear on entry
	      pvGet(pv_lvds_status[0]);
	      pvGet(pv_lvds_status[1]);

	      if(pv_lvds_status[0] && pv_lvds_status[1])
	      {
		for (j=0; j<2; j++)
		{
			pv_fdbk_status[j] = 0;
			pvPut(pv_fdbk_status[j]);
		}
	      }
	}
	      
	when (efTest(ef_lvds_status) && (pv_lvds_status[0]!=0))
	{
		//May have to clear variables
	      	efClear(ef_lvds_status);

		pvGet(pv_lvds_status[1]);
		if(pv_lvds_status[1])
		{
			for (j=0; j<2; j++)
			{
				pv_fdbk_status[j] = 0;
				pvPut(pv_fdbk_status[j]);
			}
		}
	} state lvds_high
	when (efTest(ef_lvds_status) && (pv_lvds_status[0]==0))
	{
		//Time to reenable feedback, if enabled
		efClear(ef_lvds_status);
		//Also check to see if signal is too low, and
		//don't change if that is the case
		pvGet(pv_lvds_status[1]);
		pvGet(pv_fdbk_disable[0]); //Needed to check Signal High or Low

		if (pv_lvds_status[1] && pv_fdbk_disable[0])
		{
			//Re-enable set and signal high
			for (j=0; j<2; j++)
			{
				pv_fdbk_status[j] = lvds_fdbk_latch[j];
				pvPut(pv_fdbk_status[j]);
			}
		}
	} state lvds_low
	}
}
/*
ss lvds_disable {
   state basic {
   	 when (efTestAndClear(ef_lvds_disable) && (pv_lvds_disable[0]!=0))
	 {
		//We are to disable outputs if LvdsEn asserted, since LVDS high
		pvGet(pv_lvds_disable[1]);
		if(pv_lvds_disable[1])
		{
			for (k=0; k<2; k++)
			{
				pv_fdbk_status[k] = 0;
				pvPut(pv_fdbk_status[k]);
			}
		}
	} state basic
	}
}
*/