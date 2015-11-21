accessing
countTwoLetterAmbiguities
	" Answer a <Number> with count of receiver's two-letters codes "
	
	^ (seq select: [ :letter | BioIUPACAmbiguousDNA twoLetterAmbiguityCodes includes: letter ]) size