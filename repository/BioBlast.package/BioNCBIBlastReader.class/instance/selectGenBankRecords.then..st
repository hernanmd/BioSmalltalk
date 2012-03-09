accessing-entrez
selectGenBankRecords: selectBlock then: postBlock

	| result |
	
	result := self contents.
	result contents do: [: seqRecord | 
		( selectBlock value: seqRecord )
			ifTrue: [ postBlock value: seqRecord ] ].
