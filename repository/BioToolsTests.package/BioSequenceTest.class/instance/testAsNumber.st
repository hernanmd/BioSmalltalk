testing
testAsNumber

	self assert: ('AGT' asSequence alphabet: BioDNAAlphabet new) asNumber equals: 12.
	self assert: ('GT' asSequence alphabet: BioDNAAlphabet new) asNumber equals: 12.
	self assert: ('ATGCAA' asSequence alphabet: BioDNAAlphabet new) asNumber equals: 913.
	self assert: ('GGCGGTTGCACCAGATGA' asSequence alphabet: BioDNAAlphabet new) asNumber equals: 44759798329.