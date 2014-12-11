data samples
haplotypeCollection1

	| haploStream haploColl |
	
	haploStream := ReadStream on: self haplotypeSample1 trimBoth.
	haploColl := IdentityDictionary new.	
	(self newParserFor: haploStream) rowsDo: [ : row |
		haploColl add: (row first -> row second) ].
	^ haploColl
