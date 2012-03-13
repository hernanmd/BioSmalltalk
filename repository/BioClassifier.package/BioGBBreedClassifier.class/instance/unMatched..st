accessing
unMatched: aSymbol
	" Take an action when the receiver's subect cannot be classified "
	
	self unMatchedConditions
		at: aSymbol
		ifPresent: [ : elem | ( self unMatchedConditions at: aSymbol ) add: self subject ]
		ifAbsent: [
			self unMatchedConditions 
				at: aSymbol
				put: ( OrderedCollection new add: self subject; yourself ) ].