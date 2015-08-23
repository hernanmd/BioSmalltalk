*BioParsers
matches: cmpSymbol receiver: recv

	^ recv
		perform: cmpSymbol 
		withArguments: self asArray