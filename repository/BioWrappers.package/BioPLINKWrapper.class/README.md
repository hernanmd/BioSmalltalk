PLINK wrapper requires the plink executable file to be in the PATH. 

Usage example:

BioPLINKWrapper new 
	file: 'myInputFile'; 	"Do not specify .ped extension !"
	out: 'myOutputFile';	" Do not specify output extension "
	noWeb;
	makeBed;
	execute.