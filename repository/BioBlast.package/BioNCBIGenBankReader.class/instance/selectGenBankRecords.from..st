accessing-entrez
selectGenBankRecords: selectBlock from: aDataSource
	" Off-Line version "
	
	| results |
	
	results := OrderedCollection new.
	contents
		ifNil: [ contents := ( self nodesCollectionClass filesFromXMLDirectory: aDataSource ) parseDocuments ].
	contents do: [: seqRecord | 
		( selectBlock value: seqRecord )
			ifTrue: [ results add: seqRecord ] ].
	^ results asBio: self nodesCollectionClass