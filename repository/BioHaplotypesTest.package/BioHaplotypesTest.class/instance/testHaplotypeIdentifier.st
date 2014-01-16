testing
testHaplotypeIdentifier

	| haplotypeCollection |
	
	haplotypeCollection := self haplotypes anyOne.
	self assert: (haplotypeCollection anyOne haplotypeIdentifier isKindOf: String).
