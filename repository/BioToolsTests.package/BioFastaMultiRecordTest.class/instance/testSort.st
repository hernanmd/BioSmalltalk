testing
testSort

	| newFastaCollection |
	
	self fastaCollection: (BioParser parseMultiFasta: self unsortedMultiFastaSeq).
	newFastaCollection := self fastaCollection sort.
	
	self deny: self fastaCollection isSorted.
	self assert: (newFastaCollection isKindOf: BioFastaMultiRecord).
	self deny: newFastaCollection isEmpty.
	self assert: newFastaCollection isSorted.