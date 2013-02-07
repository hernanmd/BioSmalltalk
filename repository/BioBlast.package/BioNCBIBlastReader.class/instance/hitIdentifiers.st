accessing-blast
hitIdentifiers

	| tokResult |
	
	tokResult := BioParser 
		tokenizeNcbiXmlBlast: contents 
		nodes: #('Hit_id').
	^ tokResult isEmpty
		ifTrue: [Array empty]
		ifFalse: [ tokResult at: 'Hit_id' ]