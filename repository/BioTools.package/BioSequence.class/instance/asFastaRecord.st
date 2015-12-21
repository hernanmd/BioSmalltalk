converting
asFastaRecord
	" Answer a <BioFastaRecord> filled with the receiver's name and sequence "

	^ BioFastaRecord
		named: self name
		sequence: seq