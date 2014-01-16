testing
testHaplotypes

	self assert: (self haploBlock1 haplotypes isKindOf: Collection).
	self assert: (self haploBlock1 haplotypes allSatisfy: [ : h | h isKindOf: BioHaplotype ]).
