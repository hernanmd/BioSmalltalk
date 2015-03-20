filtering-entrez
selectGenBankRecords: aBlock from: aDataSource
	" Answer a Collection of GenBank records from aDataSource satisfying condition in aBlock "
	
	^ self reader 
			selectGenBankRecords: self lastResult result
			from: aDataSource