testing
testSetIdAndDescription

	| tmpSeqRecord |
	
	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	seqRecord 
		id: 'AC12345';
		description: 'Made up sequence record description'.
	
	self assert: ( seqRecord id isKindOf: String ).
	self assert: seqRecord id = 'AC12345'.
	self assert: ( seqRecord description isKindOf: String ).
	self assert: seqRecord description = 'Made up sequence record description'.
	
	seqRecord
		id: String empty;
		description: String empty.

	self assert: ( seqRecord id isKindOf: String ).
	self assert: seqRecord id = String empty.
	self assert: ( seqRecord description isKindOf: String ).
	self assert: seqRecord description = String empty.
	