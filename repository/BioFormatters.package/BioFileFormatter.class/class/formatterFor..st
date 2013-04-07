instance creation
formatterFor: aString
	" Answer a new instance of the receiver's matching aString identifier. Examples: 
	
	self formatterFor: 'fasta'
	self formatterFor: 'GBSeq' "
	
	| aClass |
	aClass := self allSubclasses 
			detect: [ : cls | cls identifiers includesLike: aString ]
			ifNone: [ self error: 'No formatter for ' , aString ].
	^ aClass new