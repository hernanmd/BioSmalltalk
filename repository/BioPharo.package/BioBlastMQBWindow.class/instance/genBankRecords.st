callbacks
genBankRecords

	(self confirm: 'Download GenBank records from current filter?' translated)
		ifTrue: [ self blastReader downloadGenBankRecords ]