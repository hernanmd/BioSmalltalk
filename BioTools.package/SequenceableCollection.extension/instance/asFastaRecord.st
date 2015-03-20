*BioTools
asFastaRecord
	" Answer a <BioFastaRecord> "
	
	^ (BioFastaRecord 
			named: self first last 
			sequence: self second)
				addIdentifiers: self first;
				yourself
	