accessing
matched: aSymbol
	" Take an action when the receiver's subject was classified "
	
	self matches
		at: aSymbol
		ifPresent: [ : elem | (matches at: aSymbol) add: self subject ]
		ifAbsent: [
			matches 
				at: aSymbol 
				put: (OrderedCollection new add: self subject; yourself) ].
