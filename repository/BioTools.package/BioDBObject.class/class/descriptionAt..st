accessing
descriptionAt: aString
	" Answer a <String> with the receiver's description for aString identifier "

	| answer |
	
	answer := self databaseList 
			detect: [: assoc | assoc key = aString ]
			ifNone: [ nil ].
	^ answer
		ifNotNil: [ answer value ]
		ifNil: [ self nullName ]