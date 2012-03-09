accessing-blast
hitIdentifiers

	| tokResult |
	
	tokResult := BioParser 
		tokenizeNcbiXmlBlast: contents 
		nodes: #('Hit_id').
	^ tokResult
		ifNotEmpty: [ tokResult at: 'Hit_id' ]
		ifEmpty: [ Array empty  ]