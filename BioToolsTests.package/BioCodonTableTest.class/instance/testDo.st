testing
testDo

	| tempCodonTables |
	
	tempCodonTables := OrderedCollection new: BioDNACodonTables codonTables size.
	BioDNACodonTables do: [: codonTable | tempCodonTables addLast: codonTable].
	self assert: ( tempCodonTables bioHasEqualElements: BioDNACodonTables codonTables )
