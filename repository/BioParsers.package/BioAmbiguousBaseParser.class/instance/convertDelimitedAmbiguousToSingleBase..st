accessing-parsers
convertDelimitedAmbiguousToSingleBase: ambTokens

	| motif |
	
	motif := ambTokens selectAtOddPositions joinUsing: String empty.
	^ BioIUPACAmbiguousDNA ambiguousLettersMap at: motif