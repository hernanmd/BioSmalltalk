PLINK wrapper requires the plink executable file to be in the PATH.  To check it is in the PATH open and command prompt or terminal and type: 

which plink

Subclasses should implement specific PLINK versions features.

Usage example:

BioPLINKWrapper new 
	file: 'myInputFile'; 	"Do not specify .ped extension !"
	out: 'myOutputFile';	" Do not specify output extension "
	noWeb;
	makeBed;
	execute.