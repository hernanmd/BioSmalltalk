testing
testIncludesName

	| fastaRecord |
	
	fastaRecord := BioFastaRecord 
					named: 'Added Fasta Record 1'
					sequence: 'ACGT'
					alphabet: BioIUPACUnambiguousDNA.
	self fastaCollection: ( BioParser parseMultiFasta: self multiFastaSeq ).
	
	self deny: (self fastaCollection includesName: 'Added Fasta Record 1').
	self fastaCollection addFastaRecord: fastaRecord.
	self assert: (self fastaCollection includesName: 'Added Fasta Record 1').