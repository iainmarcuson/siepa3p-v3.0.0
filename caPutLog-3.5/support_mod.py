import os

support_dirname = os.getcwd();
print "Support directory is " + support_dirname;
synapps_dirname = support_dirname + "/../synApps_6_1/support";
synapps_dirname = os.path.normpath(synapps_dirname);

template_filename = "configure/RELEASE.tmpl";
release_filename = "configure/RELEASE";

template_file = open(template_filename, "rb");
release_file = open(release_filename, "wb");

for curr_line in template_file:
    if (curr_line.startswith("SNCSEQ=%SNCSEQ")):
        curr_line = "SUPPORT="+synapps_dirname+"/seq-2-2-6" + "\n";

    release_file.write(curr_line);

template_file.close();
release_file.close();


