accessing
countThreeLetterAmbiguities
	" Answer how many three-letter abiguous bases contains the receiver. Only receiver with ambiguous DNA alphabet is valid "

	^ (seq select: [ :letter | BioIUPACAmbiguousDNA threeLetterAmbiguityCodes includes: letter ]) size