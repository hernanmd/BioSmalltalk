samples
makeLayoutCoordinates
	"Answer plain text layout coordinates in a format that could be parsed in Squeak."

	"GraphViz makeLayoutCoordinates explore"

	^ self new
		beDirected;
		name: #directedGraphSample1;
		add: #graph with: {#ratio -> '0.5'};
		add: #node with: {#fontsize -> 10};	
		add: #Smalltalk -> #Squeak;
		add: #Smalltalk -> 'C++';
		add: 'C++' -> #Java;
		add: #Java -> 'C#';
		asLayoutCoordinates
