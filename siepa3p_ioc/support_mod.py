import os

support_dirname = os.getcwd();
print "Support directory is " + support_dirname;
synapps_dirname = support_dirname + "/../synApps_6_1/support";
synapps_dirname = os.path.normpath(synapps_dirname);
caput_dirname = support_dirname + "/../caPutLog-3.5"
caput_dirname = os.path.normpath(caput_dirname);

template_filename = "configure/RELEASE.tmpl";
release_filename = "configure/RELEASE";

template_file = open(template_filename, "rb");
release_file = open(release_filename, "wb");

for curr_line in template_file:
    if (curr_line.startswith("SNCSEQ=%SNCSEQ")):
        curr_line = "SNCSEQ="+synapps_dirname+"/seq-2-2-6" + "\n";
    elif (curr_line.startswith("AUTOSAVE=%AUTOSAVE")):
        curr_line = "AUTOSAVE="+synapps_dirname+"/autosave-R5-10" + "\n";
    elif (curr_line.startswith("DEVIOCSTATS=%DEVIOCSTATS")):
        curr_line = "DEVIOCSTATS="+synapps_dirname+"/iocStats-3-1-16" + "\n";
    elif (curr_line.startswith("CAPUTLOG=%CAPUTLOG")):
        curr_line = "CAPUTLOG="+caput_dirname+"\n";
        
    release_file.write(curr_line);

template_file.close();
release_file.close();


