accessing
countThreeLetterAmbiguities
	^ (seq select: [ :letter | BioIUPACAmbiguousDNA threeLetterAmbiguityCodes includes: letter ]) size