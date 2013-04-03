instance creation
newFromFlatPath: aFileLocationOrString
	" Answer a new reader using file located at aFileLocationOrString "

	^ (aFileLocationOrString contents isGenBankFlatFormat)
		ifTrue: [ self newFromFlat: aFileLocationOrString ]
		ifFalse: [ self filesFromFlatDirectory: aFileLocationOrString ]
