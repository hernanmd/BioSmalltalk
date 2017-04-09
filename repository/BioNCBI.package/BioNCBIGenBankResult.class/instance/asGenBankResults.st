converting
asGenBankResults

	^ (self result isNil or: [ self result isEmpty ])
		ifTrue: [ BioEmptyResultObject new ]
		ifFalse: [  self ]