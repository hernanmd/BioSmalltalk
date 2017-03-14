examples
example1

	BioPLINKWrapper new 
		file: 'myInputFile'; 	"Do not specify .ped extension !"
		out: 'myOutputFile';	" Do not specify output extension "
		makeBed;
		execute.