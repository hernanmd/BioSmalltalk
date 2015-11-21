accessing
countTwoLetterAmbiguities
	" Answer how many two-letter abiguous bases contains the receiver. Only receiver with ambiguous DNA alphabet is valid "
	
	^ (seq select: [ :letter | BioIUPACAmbiguousDNA twoLetterAmbiguityCodes includes: letter ]) size