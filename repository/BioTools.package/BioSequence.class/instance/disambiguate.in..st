accessing
disambiguate: letter in: allSeqs

	(BioIUPACAmbiguousDNA twoLetterAmbiguityCodes includes: letter)
		ifTrue: [
			1 to: allSeqs size / 2 do: [ : seqAnswer |
				(allSeqs at: seqAnswer) append: (self disambiguate: letter) first ].
				(allSeqs size / 2) + 1 to: allSeqs size do: [ : seqAnswer |
				(allSeqs at: seqAnswer) append: (self disambiguate: letter) second ] ]
		ifFalse: [
			(BioIUPACAmbiguousDNA threeLetterAmbiguityCodes includes: letter)
				ifTrue: [
					1 to: allSeqs size / 3 do: [ : seqAnswer | (allSeqs at: seqAnswer) append: (self disambiguate: letter) first ].
					(allSeqs size / 3) + 1 to: (allSeqs size / 3) * 2 do: [ : seqAnswer | (allSeqs at: seqAnswer) append: (self disambiguate: letter) second ].
					((allSeqs size / 3) * 2 ) + 1 to: allSeqs size do: [ : seqAnswer | (allSeqs at: seqAnswer) append: (self disambiguate: letter) third ] ]
				ifFalse: [ allSeqs do: [ : seqAnswer | seqAnswer append: letter ] ] ] 
