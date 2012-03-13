samples
connectorsDemo

	"GraphViz connectorsDemo"
	| graph costume |
	self hasConnectorsInstalled ifFalse: [self notify: 'Install Connectors in order to run any GraphViz to Connectors demos'].
	
	graph := self new.
	graph
		name: 'Connectors Demo';
		add: #node with: #style -> #filled;
		add: #Am with: #fillcolor -> #palegreen;
		add: #Dah with: #fillcolor -> #burlywood;
		add: #He with: #fillcolor -> #red1;
		add: #Baz with: #fillcolor -> #yellow3;
		add: #Car with: #fillcolor -> #ivory;
		add: #Am->#Baz->#Car;
		add: #Am->#Dah->#Baz;
		subgraphDo: [graph add: 'Be Ga'->#Am];
		add: #He->#Dah.

	costume := graph displayCostume.
	costume openInWorld