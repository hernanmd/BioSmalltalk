accessing-entrez
genBankRecordsFrom: dbSymbol format: formatSymbol

	self nextReader: self genBankReaderClass new.
	^ self nextReader
			genBankRecordsFrom: dbSymbol 
			format: formatSymbol 
			uids: self giList asArray
