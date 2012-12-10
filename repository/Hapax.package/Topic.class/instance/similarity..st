distance functions
similarity: aConcept

	| sum tally |
	[ self parent = aConcept parent ] assert.
	sum := 0. tally := 0.
	self startIndex to: self endIndex do: [ :row |
		aConcept startIndex to: aConcept endIndex do: [ :column |
			sum := sum + (self parent at: row and: column).
			tally := tally + 1. ]].
	^sum / tally