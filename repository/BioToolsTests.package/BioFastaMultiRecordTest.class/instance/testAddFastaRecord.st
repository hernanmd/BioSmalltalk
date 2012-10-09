testing
testAddFastaRecord

	| oldFastaCollectionSize |
	
	self fastaCollection: ( BioParser parseMultiFasta: self multiFastaSeq ).
	
	oldFastaCollectionSize := self fastaCollection size.
	self fastaCollection addFastaRecord:
			( BioFastaRecord 
					named: 'Added Fasta Record 1'
					sequence: 'ACGT'
					alphabet: BioIUPACUnambiguousDNA  ).
	self assert: self fastaCollection size = (oldFastaCollectionSize + 1).