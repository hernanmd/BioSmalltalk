accessing
molecularWeightNonDegen

	| dict |
	
	dict := self occurrencesOfLetters.
	^ ((dict at: $G) * 329.21) + 
		((dict at: $A) * 313.21) + 
		((dict at: $T) * 304.2) + 
		((dict at: $C) * 289.18) + 17.01.