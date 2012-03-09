accessing-entrez
genBankRecordsFrom: dbSymbol format: formatSymbol uids: anArray
	" Fetch Entrez records from database named dbSymbol in format formatSymbol
	using UIDs from anArray. anArray is splitted if exceeds #entrezUrlUidLimit "

	^ self 
		genBankSplitRecordsFrom: dbSymbol 
		format: formatSymbol 
		uids: anArray

