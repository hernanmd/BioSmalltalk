accessing-entrez
selectGenBankRecords: selectBlock then: postBlock

	| gbResults |
	
	gbResults := self contents.
	gbResults contents 
		do: [: seqRecord | ( selectBlock value: seqRecord ) ifTrue: [ postBlock value: seqRecord ] ]
		displayingProgress: 'Filtering GenBank records' .