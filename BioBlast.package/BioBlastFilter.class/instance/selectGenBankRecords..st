filtering-entrez
selectGenBankRecords: aBlock
	" Answer a Collection of GenBank records satisfying condition in aBlock "
	
	^ self reader 
			selectGenBankRecords: self lastResult result