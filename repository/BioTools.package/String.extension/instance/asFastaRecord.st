*BioTools
asFastaRecord
	" Answer a new <BioFastaRecord> filled with the receiver's name and sequence.
	Assume first line is a FASTA identifier line, and subsequent lines contains the sequences possibly separated by CRs  "
	
	^ BioFastaRecord
		named: self lines first
		sequence: ((self lines allButFirst) joinUsing: Character cr) withoutCRs