samples
undirectedGraphSample

	"GraphViz undirectedGraphSample"
	| graph |
	graph := self new.

	graph
		name: #undirectedGraphSample;
		add: #graph with: #start -> #rand;
		add: #node with: {#fontsize -> 28};
		
		add: #A -> #X;
		
		add: #node with: #shape -> #box;
		
		add: #J with: {#style -> #filled. #fillcolor -> #red. #label -> 'J\nRed'};
		add: #A -> #J;
		add: #A -> #Z;
		
		add: #graph with: {#label -> 'Test Graph'. #fontsize -> 50};
		
		openInWindow