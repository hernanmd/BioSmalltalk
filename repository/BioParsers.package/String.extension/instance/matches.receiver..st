*BioParsers
matches: cmpSymbol receiver: recv

	^ recv asLowercase
		perform: cmpSymbol
		with: self asBlastParameter
