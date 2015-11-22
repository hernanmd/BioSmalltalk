accessing
disambiguateTwoLetter: letter in: allSeqs
	1 to: allSeqs size / 2 do: [ :seqAnswer | (allSeqs at: seqAnswer) append: (self disambiguate: letter) first ].
	allSeqs size / 2 + 1 to: allSeqs size do: [ :seqAnswer | (allSeqs at: seqAnswer) append: (self disambiguate: letter) second ]