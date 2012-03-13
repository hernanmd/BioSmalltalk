samples
createAllOutputFiles
	"Generate all the output formats listed in GraphViz documentation (as of dot version 2.2).
	Results are files named 'directedGraphSample.*' in the 'dot' folder."

	"GraphViz createAllOutputFiles"

	self new
		beDirected;
		name: #directedGraphSample;
		add: #graph with: {#ratio -> '0.5'};
		add: #node with: {#fontsize -> 10};	
		add: #Smalltalk -> #Squeak;
		add: #Smalltalk -> 'C++';
		add: 'C++' -> #Java;
		add: #Java -> 'C#';
		
		makeAll
