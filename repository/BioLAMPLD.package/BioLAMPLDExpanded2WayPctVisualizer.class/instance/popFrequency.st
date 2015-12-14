initialization
popFrequency
	" Answer a <Collection> with allelic frequencies adding to heterozygous "
	
	| popArray |
	
	popArray := OrderedCollection new: self matrix numberOfColumns.
	1 to: self matrix numberOfColumns do: [ : n | 
		| col |
		col := self matrix columnAt: n.
		popArray add: ((((2 * (col at: self homozygousRowIndex)) + (col at: self heterozygousRowIndex)) / (self populationCount * 2) * 100.0) roundTo: 0.1) ].
	^ popArray
