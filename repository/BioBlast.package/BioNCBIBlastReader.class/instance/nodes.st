accessing-blast
nodes

	self parsingStrategy ifNil: [ self setSAXParser ].
	^ BioParser 
		perform: self parsingStrategy
		withArguments: {contents . self selectedNodes}