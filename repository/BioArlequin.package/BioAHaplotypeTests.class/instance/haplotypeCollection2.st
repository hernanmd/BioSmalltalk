data samples
haplotypeCollection2

	| haploStream haploColl parser |
	
	haploStream := ReadStream on: self haplotypeCollection2 trimBoth.
	haploColl := IdentityDictionary new.
	parser := ( STextParser on: haploStream ) separator: Character space.
	parser rowsDo: [ : row |
		haploColl add: ( row first -> row second )
	 ].
	^ haploColl
