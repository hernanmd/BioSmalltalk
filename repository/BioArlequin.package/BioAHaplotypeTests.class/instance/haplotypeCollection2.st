data samples
haplotypeCollection2

	| haploStream haploColl |
	
	haploStream := ReadStream on: self haplotypeCollection2 trimBoth.
	haploColl := IdentityDictionary new.
	(self newParserFor: haploStream) rowsDo: [ : row |
		haploColl add: (row first -> row second) ].
	^ haploColl
