*bioparsers
matches: cmpSymbol receiver: recv

	^ recv
		perform: cmpSymbol 
		with: self