accessing
addParseResult: aBioNCBIBlastReader

	| filterResults |
	(self parseResults includes: (filterResults := aBioNCBIBlastReader lastFilter))
		ifFalse: [ 
			self parseResults add: filterResults.
			self changed: #filterResults ]