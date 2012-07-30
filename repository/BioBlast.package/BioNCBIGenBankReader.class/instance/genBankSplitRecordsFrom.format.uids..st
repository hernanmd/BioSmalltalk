accessing-entrez
genBankSplitRecordsFrom: dbSymbol format: formatSymbol uids: anArray
	" Private - Break the request into smaller chunks splittin anArray of UIDs.
	Answer a Collection of Collections to be joined "
		
	| db dbName tmpCol |
	
	self searchResults: ( OrderedCollection new: anArray size ).
	tmpCol := OrderedCollection new.	
	anArray doWithIndex: [: id : index |
		tmpCol add: id.
		index \\ self entrezUrlUidLimit = 0
			ifTrue: [
				self bioLog: 'Requesting ' , tmpCol size asString , ' records to Entrez'.
				self searchResults add: ( self genBankFetchRecordsFrom: dbSymbol format: formatSymbol uids: tmpCol ).
				tmpCol := OrderedCollection new. ] ].
	tmpCol isEmpty
		ifFalse: [ 
			self bioLog: 'Requesting ' , tmpCol size asString , ' records to Entrez'.
			self searchResults add: ( self genBankFetchRecordsFrom: dbSymbol format: formatSymbol uids: tmpCol ) ].
	^ self searchResults