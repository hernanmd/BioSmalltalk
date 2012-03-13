samples
directedGraphSample

	"GraphViz directedGraphSample"
	| graph |
	graph := self new.

	graph beDirected.
	graph
		name: #directedGraphSample;
		add: #node with: {#fontsize -> 28};
		
		subgraph: #clusterfoo do:
			[graph
				at: #style put: #filled;
				at: #fillcolor put: #lightgrey;
				add: #A -> #B;
				at: #label put: #Foo].
		
	graph
		add: #A -> #J;
		add: #B -> #Z;
		
		add: #graph with: {#label -> 'Cluster Graph'. #fontsize -> 50};
		
		openInWindow