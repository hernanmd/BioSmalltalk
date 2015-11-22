accessing
disambiguate: letter in: allSeqs
	(BioIUPACAmbiguousDNA twoLetterAmbiguityCodes includes: letter)
		ifTrue: [ self disambiguateTwoLetter: letter in: allSeqs ]
		ifFalse: [ 
			(BioIUPACAmbiguousDNA threeLetterAmbiguityCodes includes: letter)
				ifTrue: [ self disambiguateThreeLetter: letter in: allSeqs ]
				ifFalse: [ allSeqs do: [ :seqAnswer | seqAnswer append: letter ] ] ]