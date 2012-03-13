data samples
haplotypeCollection1

	| haploStream haploColl parser |
	
	haploStream := ReadStream on: self haplotypeSample1 trimBoth.
	haploColl := IdentityDictionary new.
	parser := ( STextParser on: haploStream ) separator: Character tab.
	parser rowsDo: [ : row |
		haploColl add: ( row first -> row second )
	 ].
	^ haploColl
