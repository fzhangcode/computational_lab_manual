
if [[ `hostname -s` = redwood ]]; then
	# Add personal software path
	PATH=$PATH:/usr/local/pjf
	PATH=$PATH:/usr/local/pjf/tophat
	PATH=$PATH:/usr/local/pjf/cufflinks
	PATH=$PATH:/usr/local/pjf/bowtie
	PATH=$PATH:/usr/local/pjf/vcftools_0.1.11/bin
	PATH=$PATH:/usr/local/pjf/gurobi560/linux64/bin
	PATH=$PATH:/research/pjflaherty/mosek/7/tools/platform/linux64x86/bin
	export PATH

	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pjf/gurobi560/linux64/lib
	export LD_LIBRARY_PATH

	# VCFTOOLS perllib
	export PERL5LIB=/usr/local/pjf/vcftools_0.1.11/perl

	# GUROBI license path
	export GUROBI_HOME=/usr/local/pjf/gurobi560/linux64
	#export GRB_LICENSE_FILE=/usr/local/pjf/gurobi560/gurobi.lic

	# Add linear algebra packages
	export BLAS=/usr/lib64/atlas/libcblas.so.3
	export LAPACK=/usr/lib64/atlas/liblapack.so.3
	export ATLAS=/usr/lib64/atlas/libatlas.so.3

	# Change default command prompt
	PS1="[\u@\h \W]\$ "
	export PS1

# Set MATLAB license server location
	MLM_LICENSE_FILE=27002@matlab1.wpi.edu,27002@matlab2.wpi.edu,27002@matlab3.wpi.edu
	export MLM_LICENSE_FILE

	# Change default group to flahertylab
	# Change the default group for user by "usermod"
	newgrp flahertylab

	# Added by Canopy installer on 2013-09-26
	# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
	#VIRTUAL_ENV_DISABLE_PROMPT=1 source /research/pjflaherty/Enthought/Canopy_64bit/User/bin/activate
	#export PYTHONHOME=/research/pjflaherty/Enthought/Canopy_64bit/User/bin/

fi

# Load my aliases
source ~/.bash_aliases
source ~/.git_aliases


