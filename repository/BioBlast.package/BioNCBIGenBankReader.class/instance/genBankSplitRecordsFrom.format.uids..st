accessing-entrez
genBankSplitRecordsFrom: dbSymbol format: formatSymbol uids: anArray
	" Private - Break the request into smaller chunks splittin anArray of UIDs.
	Answer a Collection of Collections to be joined "
		
	| db dbName tmpCol index |
	
	results := ( OrderedCollection new: anArray size ).
	tmpCol := OrderedCollection new.	
	index := 1.
	anArray do: [: id  |
		tmpCol add: id.
		index \\ self entrezUrlUidLimit = 0
			ifTrue: [
				self bioLog: 'Requesting ' , tmpCol size asString , ' records to Entrez'.
				results add: ( self genBankFetchRecordsFrom: dbSymbol format: formatSymbol uids: tmpCol ).
				tmpCol := OrderedCollection new ].
		index := index + 1 ]
		displayingProgress: 'Downloading...' translated.
	tmpCol isEmpty
		ifFalse: [ 
			self bioLog: 'Requesting ' , tmpCol size asString , ' records to Entrez'.
			results add: ( self genBankFetchRecordsFrom: dbSymbol format: formatSymbol uids: tmpCol ) ].
	^ results