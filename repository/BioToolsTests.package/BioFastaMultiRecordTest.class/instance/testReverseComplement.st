testing
testReverseComplement

	| newFastaCollection firstSeq sndSeq |
	
	self fastaCollection: (BioParser parseMultiFasta: self multiFastaSeq).
	self fastaCollection alphabet: BioIUPACAmbiguousDNA.
	firstSeq := self fastaCollection sequences first.
	sndSeq := self fastaCollection sequences second.
	newFastaCollection := self fastaCollection reverseComplement.

	self assert: (newFastaCollection isKindOf: BioFastaMultiRecord).	
	self deny: newFastaCollection isEmpty.
	self assert: firstSeq reverseComplement asString = newFastaCollection sequences first asString.
	self assert: sndSeq reverseComplement asString = newFastaCollection sequences second asString.