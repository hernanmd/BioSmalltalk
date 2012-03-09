accessing-entrez
genBankRecordsFrom: dbSymbol format: formatSymbol

	self nextReader: BioNCBIGenBankReader new.
	^ self nextReader
			genBankRecordsFrom: dbSymbol 
			format: formatSymbol 
			uids: self giList asArray
