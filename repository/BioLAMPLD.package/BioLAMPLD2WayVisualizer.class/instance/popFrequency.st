private
popFrequency
	" Answer a <Collection> with allelic frequencies adding to heterozygous "
	
	| popArray snpInterval |
	
	popArray := OrderedCollection new: self matrix numberOfColumns.	
	self snpPositions: (self posFile asFileReference contents lines collect: #asNumber).
	snpInterval := (1 to: self snpCount) asArray.
	self snpPositions with: snpInterval do: [ : pos : index |
		| col avg |
		col := self matrix columnAt: index.
		avg := ((((2 * (col at: self homozygousRowIndex)) + (col at: self heterozygousRowIndex)) / (self populationCount * 2) * 100.0) roundTo: 0.1).
		popArray add: (BioSNPAncestry new
			position: pos;
			average: avg;
			yourself) ].
	^ popArray
