accessing-entrez
selectGenBankRecords: selectBlock from: aDataSource
	" Off-Line version "
	
	| tmpResults |
	
	tmpResults := OrderedCollection new.
	contents
		ifNil: [ contents := ( BioGBSeqCollection filesFromXMLDirectory: aDataSource ) parseDocuments ].
	contents do: [: seqRecord | 
		( selectBlock value: seqRecord )
			ifTrue: [ tmpResults add: seqRecord ] ].
	^ tmpResults asBio: BioGBSeqCollection