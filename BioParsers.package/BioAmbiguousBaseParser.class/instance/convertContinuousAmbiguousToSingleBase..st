accessing-parsers
convertContinuousAmbiguousToSingleBase: ambTokens

	| motif |
	
	motif := ambTokens joinUsing: String empty.
	^ BioIUPACAmbiguousDNA ambiguousLettersMap at: motif